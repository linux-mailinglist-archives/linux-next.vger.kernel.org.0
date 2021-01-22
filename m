Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEFE300AC0
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 19:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbhAVSKb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 13:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729593AbhAVSCY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Jan 2021 13:02:24 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2F2C0613D6;
        Fri, 22 Jan 2021 10:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=9NCYCn2uu0Groq7HNmcJIKyI4plVDNVRCWewLnn9RN8=; b=cXJUHCxcSZmb3WBbTCOSR35MIH
        SKSZ/AI9tzSgOHhz++Q5LuNVk/ofOefgqfOGpcSMlZwWBvgsKoeC1nEyEVjBVv3ZS6oB2/lECoM+s
        Zv5elCywH+h7Nmoy/IN2QsQCb1IraI5aaHYbGpWAoLx6TqwwJD1DaCPhX+yrN3IJWyrjE5wDWB7Zp
        3xny6jzWKrsozJ6vFU+CStctgeG0CmgnZfCzrajZAcPc1rvIU4rAgpTNufmzG17Q2jvk2AzSezD5u
        6yh3gAOHP6dzU+/9IjeChfFqrTewesgwEUZIEb03HkrEcTX3wimImj/NLUduZmdqclatfa940PiJX
        YC8/qVBw==;
Received: from [2601:1c0:6280:3f0::9abc]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l30l4-0007me-0q; Fri, 22 Jan 2021 18:02:06 +0000
Subject: Re: linux-next: Tree for Jan 22 (amdgpu)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210122180643.7039571c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <64dd3a50-a836-c1b7-738e-6b6b5433117a@infradead.org>
Date:   Fri, 22 Jan 2021 10:02:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122180643.7039571c@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/21/21 11:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210121:
> 

on i386:

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!



-- 
~Randy
