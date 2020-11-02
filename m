Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44A32A25CB
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 09:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgKBIFa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 03:05:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58140 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgKBIFa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 03:05:30 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 29BA01F44AE2;
        Mon,  2 Nov 2020 08:05:29 +0000 (GMT)
Date:   Mon, 2 Nov 2020 09:05:26 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20201102090526.39c7a38c@collabora.com>
In-Reply-To: <20201102124637.1e846861@canb.auug.org.au>
References: <20201102124637.1e846861@canb.auug.org.au>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, 2 Nov 2020 12:46:37 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the imx-drm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_close':
> drivers/gpu/drm/panfrost/panfrost_job.c:617:28: warning: unused variable 'js' [-Wunused-variable]
>   617 |  struct panfrost_job_slot *js = pfdev->js;
>       |                            ^~
> 
> Introduced by commit
> 
>   a17d609e3e21 ("drm/panfrost: Don't corrupt the queue mutex on open/close")
> 

Thanks for this report. I posted a patch [1] to fix that yesterday, and
I plan to apply it soon.

Regards,

Boris

[1]https://patchwork.kernel.org/project/dri-devel/patch/20201101173817.831769-1-boris.brezillon@collabora.com/
