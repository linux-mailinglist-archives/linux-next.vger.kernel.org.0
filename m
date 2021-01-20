Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048E92FD99F
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 20:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392493AbhATT1y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 14:27:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:60814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392168AbhATT1h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 14:27:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 675D2233FE;
        Wed, 20 Jan 2021 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611170816;
        bh=Wltzqh/AFSLIMSUDbnFXEE/IoYbVvzFNUGtqoxueUwg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=IzEmXDNilIm6ZDRR2CSsnhfkVFe0XpTXZcGf7Ojg5brUA5wbzk2SSezgFvjVENV8i
         qVv1vlQAWj4RTTpCkjOzHbQWUXAy3WVdVhB90A+rnEjTRuQBGMO5GDgoxGovdKXoUy
         GKv3t/63frA1jwaVqUSnXJUGfZw/g6/5ouptQ+Q4KyJ+coL23HwmR124wx1bNsgpNR
         rSCnw/KFIDZ3iTAmXMsPceQvsHYEtYvaEWy1atXeQKIHl/Ec/8lbvwnTAM+u39S3gk
         LFqP7Khw5kEXdLkYyJE71qF5cKDib0y164UNXORXNJuSNBbNpBwhx/R/HkoJXWjvql
         3pRRgqrosatrg==
Date:   Wed, 20 Jan 2021 13:26:53 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20210120192653.GA2569720@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120182548.5fca0433@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 20, 2021 at 06:25:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   0ca2233eb71f ("PCI: Update ROM BAR even if disabled")
> 
> is missing a Signed-off-by from its authorand committer.

My mistake, I didn't intend that commit for -next yet.  I dropped it,
thanks!
