Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15ADE8B30A
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 10:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbfHMIx6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 04:53:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727407AbfHMIx6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 04:53:58 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DFD82063F;
        Tue, 13 Aug 2019 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565686438;
        bh=5Jyukqt4Utq68hS7TqPYdFq4fD2gKzv+NWjTdQEZTfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vmpby7XCWMZSMkqL1uBE1R6f9W2VDDbo/s98BR0Sxbv1MuW62w3Hh9pOkEQi33yAQ
         lamsoQ2xUe1mZz7lIpW+1wa2tiqfdc48U3TcIuh6/suWgrLSO2MzOli0kdsl/mBLJ6
         DG4+D9Pa+p0Ux5IUxlvL498OUfmV8+9PvbR5x/Tg=
Date:   Tue, 13 Aug 2019 09:53:53 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Atish Patra <atish.patra@wdc.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm64 tree
Message-ID: <20190813085353.v6kpintr35kcwj4y@willie-the-truck>
References: <20190813093447.747a5853@canb.auug.org.au>
 <20190813082422.lecgqtknnn5g4dyj@willie-the-truck>
 <20190813184211.09b93f31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813184211.09b93f31@canb.auug.org.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 06:42:11PM +1000, Stephen Rothwell wrote:
> On Tue, 13 Aug 2019 09:24:23 +0100 Will Deacon <will@kernel.org> wrote:
> >
> > Paul, Palmer -- If it's not too late, then it would probably be best to
> > stick this commit (60c1b220d8bc) and any dependencies on their own stable
> > branch so that we can both pull it into our respective trees and I can
> > resolve this conflict in the arm64 tree, which I'll send early during the
> > merge window.
> > 
> > Looking at your tree, I guess I could just pull in
> > common/for-v5.4-rc1/cpu-topology if you promise never to rebase it. Failing
> > that, you could fork a new branch from 60c1b220d8bc and I could just pull
> > that part instead.
> 
> It may not be worth it, the conflict is not that bad.  Unless you
> forsee more conflicts arising.

Hopefully not, but it looks like it should be dead easy to resolve in this
case since the riscv tree doesn't contain anything else and the arm64 stuff
is already on its own branch.

I'll leave it up to Paul/Palmer to see what they prefer.

Will
