%module namespace_class

%inline %{
  template<class T> void foobar(T t) {}
  namespace test {
    template<class T> void barfoo(T t) {}
  }  
%}

%template(FooBarInt) ::foobar<int>;
%template(BarFooInt) test::barfoo<int>;


%inline %{

  namespace test {
    enum Hello {
      Hi
    };    
    
    struct Test;

    struct Bar  {
      Hello foo(Hello h) {
	return h;
      }
    };

    namespace hola {
      struct Bor;
      struct Foo;
      struct Foobar;
      template <class T> struct BarT {
      };

      template <class T> class FooT;
    }

    template <class T>
    class hola::FooT {
    public:
      Hello foo(Hello h) {
	return h;
      }
      
      T bar(T h) {
	return h;
      }
    };

    namespace hola {
      template <> class FooT<double>;
      template <> class FooT<int>;
    }
    
    template <>
    class hola::FooT<double> {
    public:
      double moo(double h) {
	return h;
      }
    };

    int a;

    struct hola::Foo : Bar {
      Hello bar(Hello h) {
	return h;
      }    
    };
  }
  
  struct test::Test {
    Hello foo(Hello h) {
      return h;
    }
  };

  struct test::hola::Bor {
    Hello foo(Hello h) {
      return h;
    }    
  };

  namespace test {
    struct hola::Foobar : Bar {
      Hello bar(Hello h) {
	return h;
      }    
    };
  }

  template <>
  class test::hola::FooT<int> {
  public:
    int quack(int h) {
      return h;
    }
  };

%}


namespace test
{
  namespace hola {
    %template(FooT_i) FooT<int>;
  }

  %template(FooT_H) hola::FooT<Hello>;
}

%template(FooT_d) ::test::hola::FooT<double>;
%template(BarT_H) test::hola::BarT<test::Hello>;

%inline %{

  namespace hi {
    namespace hello {
      template <class T> struct PooT;
    }

    namespace hello {
      template <class T> struct PooT
      {
      }; 
    }
  }
%}

%template(Poo_i) hi::hello::PooT<int>;

%inline %{

  template <class T> struct BooT {
  };

  namespace test {
    
    typedef ::BooT<Hello> BooT_H;
  }

%}

namespace test {
  
  %template(BooT_H) ::BooT<Hello>;
}
%template(BooT_i) ::BooT<int>;


%inline %{

namespace jafar {
  namespace jmath {
    class EulerT3D {
    public:
      static void hello(){}
      
      template<class VecFrame, class Vec, class VecRes>
      static void toFrame(const VecFrame& frame_, const Vec&v_,const VecRes& vRes){}
      
      template<class T>
      void operator ()(T& x){}

      template<class T>
      void operator < (T& x){}

    };
  }
}
%}

%template(toFrame) jafar::jmath::EulerT3D::toFrame<int,int,int>;
%template(callint) jafar::jmath::EulerT3D::operator()<int>;
%template(lessint) jafar::jmath::EulerT3D::operator< <int>;



%inline %{

namespace {
  /* the unnamed namespace is 'private', so, the following
     declarations shouldn't be wrapped */
  class Private1
  {
  };

}

namespace a
{
  namespace 
  {
    class Private2
    {
    };
  }
}
 
%}

#pragma SWIG nowarn=312

%inline %{
  class Ala {
  public : 
    Ala() {}
    class Ola {
    public:
      Ola() {}
    };
    
    template <class T>
    static void hi() 
    {
    }
  };
%}

%rename(Ala__Ola) Ala::Ola;
class Ala::Ola {
public:
  Ola() {}
};

%template(hi) Ala::hi<int>;
