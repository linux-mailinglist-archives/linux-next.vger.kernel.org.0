Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F276E184803
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 14:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgCMN0G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 09:26:06 -0400
Received: from 8bytes.org ([81.169.241.247]:51100 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgCMN0F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 09:26:05 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 8B8EA269; Fri, 13 Mar 2020 14:26:04 +0100 (CET)
Date:   Fri, 13 Mar 2020 14:26:01 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20200313132601.GM3794@8bytes.org>
References: <20200311093638.3b442a3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311093638.3b442a3d@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 11, 2020 at 09:36:38AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   57744190bf30 ("iommu/vt-d: dmar: replace WARN_TAINT with pr_warn + add_taint")
> 
> Fixes tag
> 
>   Fixes: fd0c8894893c ("intel-iommu: Set a more specific taint flag for invalid BI
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not truncate Fixes tag lines.

Fixed now, thanks.


