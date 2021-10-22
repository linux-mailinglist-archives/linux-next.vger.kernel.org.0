Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B628437F5D
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 22:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbhJVUfJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 16:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbhJVUfI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 16:35:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23300C061764;
        Fri, 22 Oct 2021 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=+lVnXP4L/xjopCY7F+iPyZIxE9scXC9YT+WrXjVhLK8=; b=IlPh6IKUYOtRL3+sWnXyOLoPp7
        DFp0B4GxlovDXICqHVZd3s4/OnjqPJ0n1GuFAYDmf0ei7EZUR+BTWxebXOXscBpuo8WJCLyvXayxY
        OllTK7++fyC6OW+g2sPD29BLyKrgJQBC+ia3pIBPKXELu/fyex2MxszfedVcjYC2SALyLW2QH9l5L
        k27VVJecaQi9DvxwO9IoeCmrAQUEwBrtkq8CNXk+r9YSPaRT8oSJu6NW6aJ6y3SsaiaJKJjT5TxrN
        h1bJdoXiBF7y+Em9k/s5Qjj6j2R8hmv7/7oy56Vd7KpM955DB3Jb8zBk1oZA5MF3Lr3PNTdwAXeqW
        Ybe6WInQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1me1De-00Bwwj-Mk; Fri, 22 Oct 2021 20:32:50 +0000
Subject: Re: linux-next: Tree for Oct 22
 (drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>
References: <20211022201533.6085b17f@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2cef7eff-e594-db38-176a-c017c8610b6a@infradead.org>
Date:   Fri, 22 Oct 2021 13:32:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022201533.6085b17f@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22/21 2:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211021:
> 

on x86_64:

../drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: In function ‘i915_gem_object_get_pages_dmabuf’:
../drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:248:3: error: implicit declaration of function ‘wbinvd_on_all_cpus’; did you mean ‘wrmsr_on_cpus’? [-Werror=implicit-function-declaration]
    wbinvd_on_all_cpus();
    ^~~~~~~~~~~~~~~~~~
    wrmsr_on_cpus


-- 
~Randy
