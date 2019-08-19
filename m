Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC69995036
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 23:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfHSVxv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 17:53:51 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58918 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHSVxv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Aug 2019 17:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jKYfgZoqVg3kBuPAviW2/HwCRWVw8YLe/13Up6WqEw4=; b=W+t9IfCmBh9jjJVtB7NH+Sxc/Q
        E0NRcVIQh5++6ysFnU/uC7OT4gNh1ZVDTfdzcwj9M28sBQNEBUihlgNTWrPOQ+pSvtB0l4siA+rcw
        TO252sWNdPBqoW3EYWg4kpYRYssZJMaPtkxpOB1YxW8OZxEyri1HnJK9rDx/Hw8MCaggxrSAaVCwb
        XZynam15gNs9LIvNideEWs7s+Q4T8zOmZKcToxABUq4gcgrFWzuiAdSsdFmrjrtJ7Cq9J7QYYjKMP
        x8ObAbcPQwjJSJNswZx000qOu0MxNJ2eMdng8/Seao8CWfzP9qudFm/SUZ+hGWiUZLbp4NCWCAHMA
        6ECpv7UQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=[192.168.1.17])
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hzpb1-0006LU-1i; Mon, 19 Aug 2019 21:53:47 +0000
Subject: Re: linux-next: Tree for Aug 19 (gpu/drm/amd/display/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org
References: <20190819191832.03f1a579@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3557b61e-bca8-1410-ff71-b7383b255c72@infradead.org>
Date:   Mon, 19 Aug 2019 14:53:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819191832.03f1a579@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/19/19 2:18 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190816:
> 


on i386:

ld: drivers/gpu/drm/amd/display/dc/core/dc_link.o: in function `wait_for_alt_mode':
dc_link.c:(.text+0x1f38): undefined reference to `__udivdi3'
ld: dc_link.c:(.text+0x1f71): undefined reference to `__udivdi3'


-- 
~Randy
