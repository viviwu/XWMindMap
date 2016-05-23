/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import <Foundation/Foundation.h>
#import "QMNode.h"

extern NSString * const qNodeLeftChildrenKey;

@interface QMRootNode : QMNode

/**
* Returns the children on the LEFT side.
*/
@property (readonly) NSArray *leftChildren;

@property (readonly, weak) NSArray *allChildren;

- (id)init;
- (id)initWithAttributes:(NSDictionary *)xmlAttributes;

- (NSUInteger)countOfAllChildren;

- (QMNode *)node;

- (NSUInteger)countOfLeftChildren;
- (QMNode *)objectInLeftChildrenAtIndex:(NSUInteger)index;
- (void)insertObject:(QMNode *)childNode inLeftChildrenAtIndex:(NSUInteger)index;
- (void)removeObjectFromLeftChildrenAtIndex:(NSUInteger)index;
- (void)addObjectInLeftChildren:(QMNode *)childNode;

@end
