Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A923063C9
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 20:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344303AbhA0TJT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 14:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344277AbhA0TJL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 14:09:11 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE43C061573;
        Wed, 27 Jan 2021 11:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=pRxuyKfUVYtNaC0BqhWAs8owtg4XfDmRLmcs5SzkWbY=; b=PsDyxsjRYL6fmY2S+GD8vcIsPm
        H8gagWKh7k/RF6ztRzMhenwRwcYpQC/MKpcHgqr4wL1Zd4fJmuyR07W7u08ugRAQx8LO6g6AROFmG
        FasEVa9dD6Nqx7SDkcrH+pgD+QHCChNCe7iIyc3tQk5BDgqrgwPlGtG/QwtOfTThJVaNfmX/xHy26
        rRkZTjbbbra7N+SGKwWqBExFPtt+NF9U55UfWVMbvrcQ8Vug3KSfTmjXbIwo92bxK8ps42Ij0uJjV
        O+VtyT+2hsblhEJ/TW9X39pAggUaeB/JKPIN+r13rETTwA2sdLgFtPnSj4mlQwgyLcdLlcNMdL6FA
        0nhHdQXQ==;
Received: from [2601:1c0:6280:3f0::7650]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l4qAx-0007wt-Rm; Wed, 27 Jan 2021 19:08:24 +0000
Subject: Re: linux-next: Tree for Jan 27 (drm/i915)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
References: <20210128014419.55ea9ae4@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
Date:   Wed, 27 Jan 2021 11:08:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210128014419.55ea9ae4@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/27/21 6:44 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Note: the patch file has failed to upload :-(
> 
> Changes since 20210125:
> 

on x86_64:

../drivers/gpu/drm/i915/i915_gem.c: In function ‘i915_gem_freeze_late’:
../drivers/gpu/drm/i915/i915_gem.c:1182:2: error: implicit declaration of function ‘wbinvd_on_all_cpus’; did you mean ‘wrmsr_on_cpus’? [-Werror=implicit-function-declaration]
  wbinvd_on_all_cpus();


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

