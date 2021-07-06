Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532553BC647
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 08:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhGFGMx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Jul 2021 02:12:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:52888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230036AbhGFGMx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Jul 2021 02:12:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D78D61260;
        Tue,  6 Jul 2021 06:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625551815;
        bh=M2lK1b9EGojPTJ/A+cveyvV8XRcYU8n/juDcPlQdMUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HWcWwIRkTXLYCodfMNNH9E3hcDvhPK+bd+ARPazmvcAkKaLmaRnjRlj2nM4OJPCDG
         cMg7g1wJwk8n/XXpbhHXpoGwxjiAR+hgeiUFsG27IfT9HLEX0wSpo99yDX9Bcq4fyr
         iXTIf8VXTBzvs0JvX5btfcEnlb2wuJ0byES2Vl7ptCX6sKFMrmcyFil+o8yG86s+k4
         hV5ekhTqv6gB0lMW6aQUvIaDIYycgaS09v2WjipaEYn+AQrId1kyUg7flTfBO+FQef
         UILOMtHRy2Vt1+hvDPVir6UjVpWTgYiZC+I9eFY5/k+d0z6xazHTRyyloCpK+IM7ZH
         B36Qzb1+rgzjw==
Date:   Tue, 6 Jul 2021 09:10:10 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the memblock-fixes tree
Message-ID: <YOPzwg7DeU1gobIr@kernel.org>
References: <20210706080621.5d497973@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706080621.5d497973@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Tue, Jul 06, 2021 at 08:06:21AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   24caecffab46 ("arm: ioremap: don't abuse pfn_valid() to check if pfn is in RAM")
> 
> Fixes tag
> 
>   Fixes: 30603c5a0c9a ("arm: ioremap: don't abuse pfn_valid() to check if pfn
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> I could not easily find the actual commit that was meant.
> 
> Also, please do not split Fixes tags over more than one line.

Should be fixed now.

-- 
Sincerely yours,
Mike.
