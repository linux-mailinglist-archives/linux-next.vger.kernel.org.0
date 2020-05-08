Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B481CB132
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 15:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgEHN5i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 09:57:38 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:45514 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgEHN5h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 09:57:37 -0400
Received: from 89-64-85-173.dynamic.chello.pl (89.64.85.173) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.415)
 id d8c954b8ac2de5b7; Fri, 8 May 2020 15:57:05 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pm tree
Date:   Fri, 08 May 2020 15:57:05 +0200
Message-ID: <1973656.7Sjq3fjOQu@kreacher>
In-Reply-To: <20200508143457.14acfc46@canb.auug.org.au>
References: <20200508143457.14acfc46@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, May 8, 2020 6:34:57 AM CEST Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the amdgpu tree got a conflict in:
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> 
> between commit:
> 
>   e07515563d01 ("PM: sleep: core: Rename DPM_FLAG_NEVER_SKIP")
> 
> from the pm tree and commit:
> 
>   500bd19a7e5d ("drm/amdgpu: only set DPM_FLAG_NEVER_SKIP for legacy ATPX BOCO")
> 
> from the amdgpu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for resolving this, the resolution looks good to me.

Cheers!



