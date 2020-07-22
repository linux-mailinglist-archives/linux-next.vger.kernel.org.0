Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15743229F30
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 20:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgGVSX2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 14:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgGVSX1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 14:23:27 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCF8C0619DC;
        Wed, 22 Jul 2020 11:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=JrD3G1WSRO2ACZGrzdo5vNTbMsFVg5sjgpFhLlIa/+M=; b=fXAmA24JXRO3SuO0hkx1FF5XHt
        yg792tJwQ6zVUMj6Nmfi7PiHNZesrNBpPEJBhI4Ep/nXPugJWcnKpe9/cfh9kK7vWiUDIpe6bAYRR
        7WylJu4yliWdoqssibniqd+FCWkZ0oBmV9uculJX5ixBLOwjoPlK/dGRRf83GU5XMHdsj+qdLAXvK
        2PYvcHdxuK6LC/cUlugfEnK27SWPoK46feIUWvltYwV+TIBO5rKXVRRcRtC0NZIynY8W+qatpuS6C
        xdt6YG2naeKlEuYJCmRlpHTGCea1ME2N5v8h7lQQYlXFDZ+yt4gTQgADt9OYieApZRAhd1fJsKSpl
        yDoDvK4w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jyJOi-00010t-4w; Wed, 22 Jul 2020 18:23:20 +0000
Subject: Re: linux-next: Tree for Jul 22
 (sound/soc/tegra/snd-soc-tegra210-dmic)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Rahul Mittal <rmittal@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
References: <20200722231640.3dae04cd@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8816636f-4b6c-5bb3-20d3-a240aceadc99@infradead.org>
Date:   Wed, 22 Jul 2020 11:23:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722231640.3dae04cd@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/22/20 6:16 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200721:
> 


on i386:

ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko] undefined!
ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko] undefined!

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
