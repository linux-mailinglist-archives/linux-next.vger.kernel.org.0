Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123823F362E
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 23:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhHTVys (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 17:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhHTVys (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 17:54:48 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93A9C061575;
        Fri, 20 Aug 2021 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=/eItskrntCPwPNY5IQJoN4D7P+kslmHM19CcoUe99AA=; b=MBXqVpjO+LE0uRP/hZjJfCphmp
        Z2eBu6bN43VtdsWHoMmhZUu5wEnYTWtaY+Tm2U4sP0gkCNe+WMI3ZHihLlA6whbOcE/I6Wn7REUMW
        Vm0rVlO/wmWOfRBHSB/WTnNfUyVLdXJ1/LNmiYiVEUNqy0rFosd7q1/vE3fzBfsYkCO05cyRjKvtt
        BW60JZk35nunOewsgmZyocIrU05pjse5kM4xHV9epZgerFhipkgHdx//riRA4L85uJjlybf4Sm9uU
        LZpSrNkucnIP2OAsGh235phFdbEHyckwbcLiEPho5UQeh+cbeuH4mqSofUtRULIwlusyouUgQP+wl
        BmHgCmFQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mHCSk-00C9qj-Du; Fri, 20 Aug 2021 21:54:06 +0000
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210820192615.23e2e617@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
Date:   Fri, 20 Aug 2021 14:54:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210820192615.23e2e617@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/20/21 2:26 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210819:
> 

Both linux-next and mmotm have many of these warnings when using
gcc (SUSE Linux) 7.5.0:

cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

