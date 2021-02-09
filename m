Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E2931530D
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 16:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhBIPo0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 10:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhBIPoX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 10:44:23 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F477C061788;
        Tue,  9 Feb 2021 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=s5g4oRzdusm7nzm3YBSDj6A0RZP/j9xutjAb4yxZeGc=; b=AqnQ8e/H7bgSWr6o6uJ5Ri8lBW
        IP8Vfk7QFeBFOmPAiXDbeix0b1Fmot0QgGrDEUSbY16LgAopd/aAWe8BnimcxQxkqstCng1eYdlnx
        4inPGo4f92RRVnCDzjdVpzp+RIK3i1Ee4llLmJdYepKFNBBsWBQamycXysxFKN6Ti5v1j0YIEG8O/
        FHBymeP5SsGB3VV4hhnrKZwz6SGe1MJpgD2N2pf15VOp59F1f8cvuzgwtMvNgu5N07mWbMWyeGqtM
        UCNqWz0wp7/eqpbaac+o5qjn6lddECFfwuHPlXfmdNeCzjnIEKLju273SRILFYBz7pKi+HMbo55qY
        fJhldnRw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9VAx-007dEz-Na; Tue, 09 Feb 2021 15:43:40 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DA4983010D2;
        Tue,  9 Feb 2021 16:43:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C6FE22BC9353D; Tue,  9 Feb 2021 16:43:38 +0100 (CET)
Date:   Tue, 9 Feb 2021 16:43:38 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Sven Schnelle <svens@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH] uprobes: add missing get_uprobe() in __find_uprobe()
Message-ID: <YCKtqnOu9IaEWeM3@hirez.programming.kicks-ass.net>
References: <20210209150711.36778-1-svens@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209150711.36778-1-svens@linux.ibm.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 04:07:11PM +0100, Sven Schnelle wrote:
> commit c6bc9bd06dff49fa4c("rbtree, uprobes: Use rbtree helpers") from
> next-20210208 accidentally removed the refcount increase. Add it again.
> 

Thanks, and sorry about that!
