Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 556B0A943D
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 22:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbfIDU62 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 16:58:28 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34844 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfIDU62 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Sep 2019 16:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RySvkA4PqDSjeZsiLdGzYmedvJgqhRvVYcnWJF/ahYY=; b=QO7/P7gHmvX8Mwzs+sfP6cUwP
        F6s3cPMwa8vVNxBwmN+xo48tUORqOS2p2CJ0UixJzBsPvGt35pc5CcP2zOtTX8SlLSnWLVcXJjDfJ
        iusNjIpcM2eN7kWOD52ArqmyDzy5XKpXI+lD3QEbklIp0CdV9cXhtT2DXz5P0ufrzw+6XMKvv9YRG
        j1UKNWosS8ePE6QFjG0BJ+RnOMYmJFNyuUtDn4MZU9tPKS/LbzPH7hjscmzBQte7ymS6pWjp2xfCD
        Iig8s1yLMMYULue2Dq6l0I3I7m0i7zxYg7dCvlaMeK0k/cExT0GW6z42tE6JvnY1cnzNN1+CPYiHu
        e3EfEi7vw==;
Received: from [2601:1c0:6200:6e8::e2a8]
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5cME-00010R-Up; Wed, 04 Sep 2019 20:58:27 +0000
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>
References: <20190904233443.3f73c46b@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
Date:   Wed, 4 Sep 2019 13:58:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904233443.3f73c46b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/4/19 6:34 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: this will be the last linux-next I will release until Sept 30.
> 
> Changes since 20190903:
> 

on x86_64:

In file included from ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:77:0:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.h: In function ‘dml_min’:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.h:34:1: error: SSE register return with SSE disabled


-- 
~Randy
