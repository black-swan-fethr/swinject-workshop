# Swinject workshop

## DI and terminology

Swinject documentation has a quite good start on this. [Link](https://github.com/Swinject/Swinject/blob/master/Documentation/DIContainer.md#di-container)

## Basic registrations - 0

_Let's say we are creating an app for a bakery store. Silly I know, but for this workshop we will stick to this example. This bakery sells it's own products, some sandwiches made of these and hot drinks. They even have menus just to encourage people to come in the morning and have a breakfast for example._

![](./Bakery_0.png)

Talk about registration keys: 
	Key(type, name, argument number AND type) --> so two arguments with different types swithced is good to go
	
Argument types should be exactly the same as in the registration. No superclasses or optionals or implementation/interface exchanges.

## InjectionPatterns - 1

### Initializer injection - 1.1

The previous example with sandwich was this.

### Property injection - 1.2

Ok, if the dependency is optional to the dependent, or if the architecture doesn't permits us to inject through init (UIViewControllers?).

### Method injection - 1.3

Most of the time we would like to avoid this, as methods should be more like interactions or request towards the objects. Passing dependencies in methods hides the importance of that dependency. That said we might end up in situations (3rd party, legacy code) where we have constraints over modification of the created objects but we might still create an instance in a factory method with all of iot's dependencies.