Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3E41CF8C1
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 17:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgELPQE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 11:16:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:52956 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725888AbgELPQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 11:16:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 713BDAD31;
        Tue, 12 May 2020 15:16:05 +0000 (UTC)
Date:   Tue, 12 May 2020 17:16:00 +0200
From:   Joerg Roedel <jroedel@suse.de>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: next/master bisection: baseline.login on jetson-tk1
Message-ID: <20200512151600.GD8135@suse.de>
References: <5eb9fab4.1c69fb81.a1f1c.0e95@mx.google.com>
 <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Guillaume,

thanks for the report!

On Tue, May 12, 2020 at 07:05:13AM +0100, Guillaume Tucker wrote:
> > Summary:
> >   Start:      4b20e7462caa6 Add linux-next specific files for 20200511
> >   Plain log:  https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.txt
> >   HTML log:   https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.html
> >   Result:     3eeeb45c6d044 iommu: Remove add_device()/remove_device() code-paths

Okay, so it faults at

	PC is at __iommu_probe_device+0x20/0x1b8

Can you translate that for me into a code-line, please? That would help
finding the issue.


Thanks,

	Joerg

