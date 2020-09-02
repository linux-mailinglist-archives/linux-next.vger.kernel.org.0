Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35F925AB30
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 14:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIBMdP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 08:33:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgIBMdO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Sep 2020 08:33:14 -0400
Received: from localhost (47.sub-72-107-117.myvzw.com [72.107.117.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5A6120767;
        Wed,  2 Sep 2020 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599049994;
        bh=ScmamFwr6cDFOdzEmFjSzTkjMsENlybYDm1nj4gdr/4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=rxNuxdBYXF91GjKuZpwD5+3BghyRQIB7BLRhOhQDhM339gErTbt6W3UfUksRhNvKM
         XrU8gLtUT9sblFgz/K0Rn8RdCbqzUjctqwbfX1ltqwdSXge8TCYjes5IGfdjwyIxiY
         sIi5HaIopmReNWPq1GKIrt7eFRrZheAhmAAah5dY=
Date:   Wed, 2 Sep 2020 07:33:12 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20200902123312.GA242674@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902110743.0519779d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 02, 2020 at 11:07:43AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/pci/pci-driver.c: In function 'pci_pm_thaw_noirq':
> drivers/pci/pci-driver.c:1037:6: warning: unused variable 'error' [-Wunused-variable]
>  1037 |  int error;
>       |      ^~~~~
> drivers/pci/pci-driver.c: In function 'pci_pm_restore_noirq':
> drivers/pci/pci-driver.c:1169:6: warning: unused variable 'error' [-Wunused-variable]
>  1169 |  int error;
>       |      ^~~~~
> 
> Introduced by commit
> 
>   89a8561c63d3 ("PCI: Remove unused pcibios_pm_ops")

Fixed, thanks!
