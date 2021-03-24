Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA033347E1D
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 17:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbhCXQqb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 12:46:31 -0400
Received: from foss.arm.com ([217.140.110.172]:36282 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236991AbhCXQqB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Mar 2021 12:46:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92A1DD6E;
        Wed, 24 Mar 2021 09:46:00 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EF203F7D7;
        Wed, 24 Mar 2021 09:45:59 -0700 (PDT)
Date:   Wed, 24 Mar 2021 16:45:51 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20210324164551.7fedf89c@slackpad.fritz.box>
In-Reply-To: <20210324154613.GA3709@arm.com>
References: <20210324081445.7db17c31@canb.auug.org.au>
        <20210324154613.GA3709@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 24 Mar 2021 15:46:14 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Wed, Mar 24, 2021 at 08:14:45AM +1100, Stephen Rothwell wrote:
> > Commits
> > 
> >   b17f265bb4cc ("kselftest/arm64: mte: Fix MTE feature detection")
> >   4dfc9d30a8ab ("kselftest/arm64: mte: common: Fix write() warnings")
> > 
> > are missing a Signed-off-by from their author.  
> 
> Thanks Stephen. Now fixed.

Thanks Catalin, and apologies for the blunder, that's what I get from
trying multitasking with just a single X chromosome ;-)

Cheers,
Andre
