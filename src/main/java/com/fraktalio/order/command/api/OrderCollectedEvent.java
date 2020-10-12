package com.fraktalio.order.command.api;

import java.util.Objects;

public final class OrderCollectedEvent {

    private final OrderId aggregateIdentifier;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        OrderCollectedEvent that = (OrderCollectedEvent) o;
        return aggregateIdentifier.equals(that.aggregateIdentifier);
    }

    @Override
    public int hashCode() {
        return Objects.hash(aggregateIdentifier);
    }

    public OrderCollectedEvent(OrderId aggregateIdentifier) {
        this.aggregateIdentifier = aggregateIdentifier;
    }

    public OrderId getAggregateIdentifier() {
        return aggregateIdentifier;
    }
}
