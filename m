Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96BC42ADA6
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 22:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLUPM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 16:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLUPM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 16:15:12 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56400C061570;
        Tue, 12 Oct 2021 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=n58V8M3p+f5+C2ZTAmK8/0SrMrG0LAFyRVyaZfvNw60=; b=B1u4HyWlWb7hP3n/XPr38CccP+
        6276I54bo3AJ8W14Yr5qsPbw5erpUbhPpGlJOlvpNAWkf4wQRWWWpgM/Z2SyHzoovu/5VST15upPe
        W/OGIkBBLo8jhNu8i3oo0R0ACCrNHtsbYQquyeb4wUkuFmaQpu8y7qW1DkYzxM47OUdML9vgQK994
        Ny3oNhG/ZoWs/J7r7Lmb+xIsyi2xk8uJ/TqzXj94rC41LbhUySoIom0uEqWGuFPgfvZeuC0N3g8wS
        4XnQN0KSTa60qIJxM0w753MpJqVjVs7W7wpIAVrhnL3O5RZysydQzlJWzQQykgw0ATko+cViBSsf1
        VOEcgSQw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1maO97-00DuIm-Hg; Tue, 12 Oct 2021 20:13:09 +0000
Subject: Re: linux-next: build warnings in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211012215651.300f8bc1@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <87ec4a83-1262-03b9-dd86-f37568b38df0@infradead.org>
Date:   Tue, 12 Oct 2021 13:13:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012215651.300f8bc1@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/12/21 3:56 AM, Stephen Rothwell wrote:
> Hi all,
> 
> When building Linus' tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> Error: Cannot open file drivers/counter/counter.c
> Error: Cannot open file drivers/counter/counter.c
> 
> Introduced by commit
> 
>    d70e46af7531 ("counter: Internalize sysfs interface code")
> 
> $ git grep -w drivers/counter/counter.c Documentation
> Documentation/driver-api/generic-counter.rst:.. kernel-doc:: drivers/counter/counter.c
> 

Jonathan has already accepted my patch for this docs error.
Hopefully it will show up in mainline soonish.

thanks.
-- 
~Randy
