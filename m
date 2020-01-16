Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAEA13FDA8
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 00:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbgAPX1o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 18:27:44 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:42951 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390324AbgAPX1o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 18:27:44 -0500
Received: from 79.184.255.90.ipv4.supernova.orange.pl (79.184.255.90) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.320)
 id 4b8442e69dabda39; Fri, 17 Jan 2020 00:27:41 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Date:   Fri, 17 Jan 2020 00:27:41 +0100
Message-ID: <1721306.C5hDvk6sIF@kreacher>
In-Reply-To: <alpine.LRH.2.20.2001161120230.2505@dhcp-10-175-200-122.vpn.oracle.com>
References: <20200116165703.4e04be51@canb.auug.org.au> <alpine.LRH.2.20.2001161120230.2505@dhcp-10-175-200-122.vpn.oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thursday, January 16, 2020 12:23:09 PM CET Alan Maguire wrote:
> On Thu, 16 Jan 2020, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > After merging the kunit-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > x86_64-linux-gnu-ld: drivers/base/test/property-entry-test.o: in function `kunit_test_suites_init':
> > property-entry-test.c:(.text+0x26): undefined reference to `kunit_run_tests'
> > x86_64-linux-gnu-ld: drivers/base/test/property-entry-test.o: in function `pe_test_reference':
> > property-entry-test.c:(.text+0x275): undefined reference to `kunit_binary_assert_format'
> > x86_64-linux-gnu-ld: property-entry-test.c:(.text+0x2c4): undefined reference to `kunit_do_assertion'
> > 
> > and lots more ...
> > 
> > Caused by commit
> > 
> >   27f9d7e984d9 ("software node: introduce CONFIG_KUNIT_DRIVER_PE_TEST")
> > 
> > from the pm tree interacting with commit
> > 
> >   35c57fc3f8ea ("kunit: building kunit as a module breaks allmodconfig")
> > 
> > I have disabled CONFIG_KUNIT_DRIVER_PE_TEST for today.
> >
> 
> Apologies again, I should have explicitly specified that
> CONFIG_KUNIT_DRIVER_PE_TEST depends on KUNIT=y; I've
> sent a patch to fix this:
> 
> https://lore.kernel.org/lkml/1579173451-2439-1-git-send-email-alan.maguire@oracle.com/T/#u

I have folded this into the original patch and remerged the linux-next branch.

Thanks!



