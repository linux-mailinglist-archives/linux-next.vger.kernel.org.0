Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF831E0DEF
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 13:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390196AbgEYLzg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 07:55:36 -0400
Received: from 8bytes.org ([81.169.241.247]:44514 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390169AbgEYLzg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 07:55:36 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 99B1D327; Mon, 25 May 2020 13:55:34 +0200 (CEST)
Date:   Mon, 25 May 2020 13:55:31 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20200525115530.GA5221@8bytes.org>
References: <20200520043631.41a150d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520043631.41a150d2@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 20, 2020 at 04:36:31AM +1000, Stephen Rothwell wrote:
> Maybe you meant
> 
> Fixes: b0d1f8741b81 ("iommu/vt-d: Add nested translation helper function")
> Fixes: 56722a4398a3 ("iommu/vt-d: Add bind guest PASID support")

Updated, thanks.
