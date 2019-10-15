Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE1F9D72CE
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 12:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730098AbfJOKIc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 06:08:32 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:42179 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfJOKIc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 06:08:32 -0400
Received: from 79.184.254.38.ipv4.supernova.orange.pl (79.184.254.38) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id f3158b613d74c100; Tue, 15 Oct 2019 12:08:30 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
Date:   Tue, 15 Oct 2019 12:08:30 +0200
Message-ID: <1939453.vQCUMVWpfK@kreacher>
In-Reply-To: <20191015075904.6b5adcff@canb.auug.org.au>
References: <20191015075904.6b5adcff@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Monday, October 14, 2019 10:59:04 PM CEST Stephen Rothwell wrote:
> 
> --Sig_/eM_f_lhAmw+jp3bqTr5YSMd
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi all,
> 
> In commit
> 
>   b2afd668c323 ("ACPI / utils: Move acpi_dev_get_first_match_dev() under CO=
> NFIG_ACPI")
> 
> Fixes tag
> 
>   Fixes: 817b4d64da03 ("Introduce acpi_dev_get_first_match_dev() helper")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject

Fixed, thanks!



