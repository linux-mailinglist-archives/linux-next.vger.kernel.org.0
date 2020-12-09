Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247C82D43CA
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 15:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgLIOBf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 09:01:35 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:39681 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728855AbgLIOBZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 09:01:25 -0500
Received: from [100.112.1.102] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id F0/C3-00973-897D0DF5; Wed, 09 Dec 2020 13:56:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleJIrShJLcpLzFFi42JJl3vFrjvt+oV
  4g59twhZPDrQzWrw5Pp3J4vKuOWwWBxe2MVqcOX2J1WLr3qvsDmwejTdusHks7pvM6vF+31U2
  jy1X21k8Pm+SC2CNYs3MS8qvSGDNeN1yi7ngFWfFp/bPrA2Mqzm6GLk4hAT+M0rMnPWWCcJ5z
  igxY95k5i5GDg5hAR+Jb/8zQEwRgVCJe7eyQEqYBXYzSjzuWcMEEhcSMJPYusC7i5GTg01AW2
  LLll9sIDavgK3E1P6dYDaLgIrEvzd/GEFsUYFwifVLVjJC1AhKnJz5hAXE5hQwl7i85RMziM0
  sYCBxZNEcVghbXOLWk/lMELa8xPa3c8BqJAQUJPrf9LFD2AkSy17eYZ7AKDgLydhZSEbNQjJq
  FpJRCxhZVjGaJhVlpmeU5CZm5ugaGhjoGhoa6RrqmhjoJVbpJumVFuumJhaX6BrqJZYX6xVX5
  ibnpOjlpZZsYgTGT0oBo8YOxs43H/QOMUpyMCmJ8k69dCFeiC8pP6UyI7E4I76oNCe1+BCjDA
  eHkgTv1KtAOcGi1PTUirTMHGAsw6QlOHiURHhFrwGleYsLEnOLM9MhUqcYFaXEecNB+gRAEhm
  leXBtsPRxiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbzXIeJ7MvBK46a+AFjMBLea5dB5k
  cUkiQkqqgUlTo9b7X7NlukrZ70rmJwbW029rXhacFnhtzgK1FW/blv1Uuxx/PVqp+czVGYs6e
  bKkHlXF1l5r/3/e/LPnhPKa+ujMqHCn89fMjoTc6PY7Fb7gZqbUtboGWZfcb7YyMQv90tb7Vp
  Xqc6c8rA/6syz/gHmD6xNN7o9ab7+cmXAq/6NlCk98euupru+fqm43Hbll7eh1KbhC+/LUqd9
  i9+6SCzwr0rekWL7LIWyTT6+cdRXz9a3X7/0rO8nwzHsn36aTe+X5vY8qCAiIz9GrYTtZd2iN
  dviSz+EBKcIvvpyPstT8WlH8e++j2JOsWx5NffMzP+mufP/R/fZsNpM8rvQz2nxrfLYr4y671
  DWZtUosxRmJhlrMRcWJAOnvF96aAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-396.messagelabs.com!1607522196!74709!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7929 invoked from network); 9 Dec 2020 13:56:38 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-9.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Dec 2020 13:56:38 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 7D8A8C6CC430F0FD5DFA;
        Wed,  9 Dec 2020 21:56:34 +0800 (CST)
Received: from localhost.localdomain (10.38.54.222) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Wed, 9 Dec 2020
 05:56:32 -0800
Subject: Re: [External] linux-next: build failure after merge of the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC:     Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201209205754.41ac2424@canb.auug.org.au>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <203934b6-dd68-b02d-757f-c0336352d397@lenovo.com>
Date:   Wed, 9 Dec 2020 08:56:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209205754.41ac2424@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.54.222]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 09/12/2020 04:57, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (htmldocs) failed
> like this:
> 
> Sphinx parallel build error:
> docutils.utils.SystemMessage: /home/sfr/next/next/Documentation/ABI/testing/sysfs-platform_profile.rst:1: (SEVERE/4) Missing matching underline for section title overline.
> 
> =======================================================================
>  Platform Profile Selection (e.g. :ref:`\/sys\/firmware\/acpi\/platform_profile <abi_sys_firmware_acpi_platform_profile>`)
> 
> Caused by commit
> 
>   ff950bebd0e0 ("Documentation: Add documentation for new platform_profile sysfs attribute")
> 
My apologies - I hadn't run the 'make htmldocs' command so I missed this
one.

I've been able to reproduce the error and fix the error. I do see:
   WARNING: document isn't included in any toctree
but I think this is benign - I believe I'm getting it just because I
converted the file to .rst (as requested by Andy Shevchenko). If this is
important and needs to be addressed urgently as well let me know.

Rafael - I want to run a couple more sanity tests and will push the
update for this (with the other fixes for the platform_profile.c code)
for review later today.

Thanks
Mark
