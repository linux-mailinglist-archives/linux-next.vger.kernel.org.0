Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B718DC122
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 11:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442241AbfJRJeK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 05:34:10 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:49773 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbfJRJeK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Oct 2019 05:34:10 -0400
Received: from 79.184.255.51.ipv4.supernova.orange.pl (79.184.255.51) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 10524a0729761fd6; Fri, 18 Oct 2019 11:34:08 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: linux-next: manual merge of the pm tree with the printk tree
Date:   Fri, 18 Oct 2019 11:34:08 +0200
Message-ID: <2158297.kSde27ogMe@kreacher>
In-Reply-To: <20191018101938.0947d0b2@canb.auug.org.au>
References: <20191018101938.0947d0b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, October 18, 2019 1:19:38 AM CEST Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   lib/test_printf.c
> 
> between commit:
> 
>   57f5677e535b ("printf: add support for printing symbolic error names")
> 
> from the printk tree and commit:
> 
>   f1ce39df508d ("lib/test_printf: Add tests for %pfw printk modifier")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks good to me, thank you!

Sakari, please double check.



