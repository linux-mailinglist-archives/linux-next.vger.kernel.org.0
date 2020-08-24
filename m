Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0A924FC45
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 13:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgHXLGx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 07:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgHXLGw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 07:06:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75135C061573;
        Mon, 24 Aug 2020 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ohQb6esAa782/eIrhlce2XvDBGSTUTKIVr+3ovcDvsQ=; b=e0F1Tbt9Ej9RJfZZz5VToqrdh5
        apDwwZI6rZwCF0XZkWZcWmnGaL48hCLwr+0ZtiqIOD5YNEQ2vtB99xoojMVQLzo9PMP8juHt+WWbM
        Mwo2wIafr27xyUXS7yvzAj4tQHnJoOlOW5QRXaCqCnbrocZclk7RckLIl4XTNa7jMMkSckUI5Oho8
        ZJcV68z6K4CtxsGcSnFiBxJXk3/oWoXO21l8zWiZxFLEbXqCAVVjrIxi9OqsgZKWKVXkCCtmjh5US
        jmHt9aLDPA4zq/qBbcyGGFOh+rv/2/taQP72+ePsKSxPfggx4aEPMtLypZ+9/b8GYz3g3rUidwLMO
        3cWQigwQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kAAJJ-0007jg-UW; Mon, 24 Aug 2020 11:06:46 +0000
Date:   Mon, 24 Aug 2020 12:06:45 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        LTP List <ltp@lists.linux.it>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Xu <peterx@redhat.com>, opendmb@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal.mohd.ma@gmail.com, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: BUG: Bad page state in process true  pfn:a8fed on arm
Message-ID: <20200824110645.GC17456@casper.infradead.org>
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> [   67.550767] page:9640c0ab refcount:0 mapcount:-1024

Somebody freed a page table without calling __ClearPageTable() on it.

