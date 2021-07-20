Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148C33D03BD
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 23:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhGTUbg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 16:31:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235167AbhGTUXE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jul 2021 16:23:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFD6161029;
        Tue, 20 Jul 2021 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1626815021;
        bh=6/t6kOumz2cz91wG1yi0SGopJvZecGc3KZNUxMvnLJg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mx/4INWMRtVWWjRcemE6Wn1WVCPZYfIJ9xUVxXCdWqgztnSh1V6KlOY5yFpfdqiiI
         oWgtp7o9Yab16nUTVEDZdx3PJNEVZmT12MaB8BndOvtSVI99aafsiJq9bFFigZod+G
         1G4LTtCFqV/wemQYXkYNaegMGnP5hot4lRdgiKhs=
Date:   Tue, 20 Jul 2021 14:03:39 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-Id: <20210720140339.cfdf2932cbd750e3af19ada2@linux-foundation.org>
In-Reply-To: <20210720182339.63c55429@canb.auug.org.au>
References: <20210720182339.63c55429@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 20 Jul 2021 18:23:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (arm64
> randconfig) failed like this:
> 
> arch/arm64/include/asm/neon-intrinsics.h:33:10: fatal error: arm_neon.h: No such file or directory
> 
> Also, the nds32 defconfig build failed like this;
> 
> arch/nds32/include/asm/nds32.h:13:10: fatal error: nds32_intrinsic.h: No such file or directory
> 
> Presumably caused by commit
> 
>   6f4266a78a4e ("kbuild: decouple build from userspace headers")

I'm seeing several reports against that patch so I dropped it for now.
