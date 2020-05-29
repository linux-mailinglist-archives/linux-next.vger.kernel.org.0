Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40071E89DA
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 23:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgE2VSo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 17:18:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgE2VSo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 17:18:44 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09BCB206A4;
        Fri, 29 May 2020 21:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590787124;
        bh=AngJgtK5EUPd1+aDY/U4ZWwkNRFFcBeTzGQkAUKr8aA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GvBC74cWsX4gVV98hIarLZzzbwAL8bpIbEZg7Rh90f6ii7NDRDQJWR3G3gVcMoGlQ
         9SAGp/N6rwXHCaVlIWGA7ZKP9HRnG/lHNR3PhGOczdlI8U3EVEYkdys+wrN1yaUEmr
         7epvuQGp3u+T+qkSwahTVzsVlu3cgkE+pf2uBs6A=
Date:   Fri, 29 May 2020 14:18:43 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Paul Walmsley <paul@pwsan.com>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, zong.li@sifive.com,
        rppt@linux.ibm.com
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 rsic-v tree
Message-Id: <20200529141843.5bf4c1b34d896af3a8ccf059@linux-foundation.org>
In-Reply-To: <mhng-42a49fa7-9216-40d3-9862-d5bed0d97eec@palmerdabbelt-glaptop1>
References: <20200528192211.2449bd4f@canb.auug.org.au>
        <mhng-42a49fa7-9216-40d3-9862-d5bed0d97eec@palmerdabbelt-glaptop1>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 28 May 2020 12:19:35 -0700 (PDT) Palmer Dabbelt <palmer@dabbelt.com> wrote:

> On Thu, 28 May 2020 02:22:11 PDT (-0700), Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> >
> >   arch/riscv/Kconfig
> >
> > between commit:
> >
> >   b151fefd23b7 ("riscv: sort select statements alphanumerically")
> 
> Andrew: Maybe it's easier if just drop the patch?  It comes from a script, so I
> can just resurrect it when things are less busy.
> 

That's OK - whoever merges second will have some trivial fixing to do,
not a big deal.

