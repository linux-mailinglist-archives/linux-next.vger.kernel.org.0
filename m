Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B25AA691
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2019 16:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390124AbfIEOyc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Sep 2019 10:54:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41616 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390090AbfIEOyc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Sep 2019 10:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s6tAAQYhXVNkbT0qRFk7hwIqccKZKc+HllFbPMAhXzQ=; b=L0jomP63rgBFMv/c20KdK1HHI
        na/AFiiTkpvGZuPuT6Gypw9honlxILA27VWorgleWFoB/8nMjgSKel7vSdDzdLVpNOfptyQdop144
        wLK0UjdZXIb4HkM1tOBTi0XvjXCitR7WI6YiFycciC9jDjRsIMAggvjUbQcLHiG9cCUqmmnnH9KVY
        6su+2m9aQoaZAsc2+vMB/qQXgmZOFEeCiWRT+sAeNNFGd9uiZ4l66D5vMgrjH5PShjQJQ3MIbzyWv
        aHzbbkFtlvVo7Vo9L+P+z+Z6mbb6qPScQCzbAKeREG0DWBQ0tE36Ce29Eo51LIVUfjo4Robd1OKq/
        mfkyuGXQQ==;
Received: from [2601:1c0:6200:6e8::e2a8]
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5t9a-0001B5-D4; Thu, 05 Sep 2019 14:54:30 +0000
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To:     Harry Wentland <hwentlan@amd.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Wentland, Harry" <Harry.Wentland@amd.com>,
        "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
References: <20190904233443.3f73c46b@canb.auug.org.au>
 <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
 <752f74d6-f6ff-6013-25ad-a8fdce934d17@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d29463cd-0497-41f2-a502-110b02c7abc8@infradead.org>
Date:   Thu, 5 Sep 2019 07:54:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <752f74d6-f6ff-6013-25ad-a8fdce934d17@amd.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/5/19 6:17 AM, Harry Wentland wrote:
> 
> 
> On 2019-09-04 4:58 p.m., Randy Dunlap wrote:
>> On 9/4/19 6:34 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> News: this will be the last linux-next I will release until Sept 30.
>>>
>>> Changes since 20190903:
>>>
>>
>> on x86_64:
>>
>> In file included from ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:77:0:
>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.h: In function ‘dml_min’:
>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.h:34:1: error: SSE register return with SSE disabled
>>
> 
> Is that fixed by Stephen's fixup here?
> 
> https://lists.freedesktop.org/archives/dri-devel/2019-September/234292.html

That patch is already in linux-next, so No, it's not.

I am using:
> gcc --version
gcc (SUSE Linux) 7.4.1 20190424 [gcc-7-branch revision 270538]


-- 
~Randy
