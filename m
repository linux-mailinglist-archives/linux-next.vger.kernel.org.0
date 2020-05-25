Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E275D1E0DCA
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 13:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390196AbgEYLv2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 07:51:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:44394 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390401AbgEYLv1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 07:51:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 16104AD88;
        Mon, 25 May 2020 11:51:28 +0000 (UTC)
Date:   Mon, 25 May 2020 13:51:23 +0200
From:   Joerg Roedel <jroedel@suse.de>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>, linux-next@vger.kernel.org
Subject: Re: next/master bisection: baseline.login on panda
Message-ID: <20200525115123.GF5075@suse.de>
References: <5ec4eb8e.1c69fb81.19b63.0b07@mx.google.com>
 <d30e5ea4-85ae-75c2-2334-f9f951026afd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d30e5ea4-85ae-75c2-2334-f9f951026afd@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Guillaume,

On Wed, May 20, 2020 at 10:54:44AM +0100, Guillaume Tucker wrote:
> Please see the bisection report below about a boot failure.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> Unfortunately there isn't anything in the kernel log, it's
> probably crashing very early on.  The bisection was run on
> omap4-panda, and there seems to be the same issue on
> omap3-beagle-xm as it's also failing to boot.

The issue is likely a deadlock fixed by:

	https://lore.kernel.org/r/20200519132824.15163-1-joro@8bytes.org

The patch is already in the iommu-tree and should show up in linux-next
soon.

Regards,

	Joerg

