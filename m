Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A642D451B
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 16:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgLIPJc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 10:09:32 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.113]:62520 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726456AbgLIPJQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 10:09:16 -0500
Received: from [100.112.4.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-c.us-east-1.aws.symcld.net id 00/05-29078-287E0DF5; Wed, 09 Dec 2020 15:04:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleJIrShJLcpLzFFi42JJl3vFrlv7/EK
  8we9GY4snB9oZLd4cn85kcXnXHDaLgwvbGC3OnL7EarF171V2BzaPxhs32DwW901m9Xi/7yqb
  x5ar7SwenzfJBbBGsWbmJeVXJLBmbHnxha3gGmfF3GvNbA2MT9m7GLk4hAT+M0pc37qfCcJ5z
  iix4fQnIIeDQ1jAR+Lb/wwQU0RAReJVZxhICbPAG0aJ/c9fMXYxcgLV9zBKHOgUBLHZBLQltm
  z5xQZi8wrYSmxavooRpJcFqHfVZF2QsKhAuMT6JSsZIUoEJU7OfMICYnMK6Else74TbCuzgKb
  E+l36IGFmAXGJW0/mM0HY8hLb385hBrElBBQk+t/0sUPYCRLLXt5hnsAoOAvJ1FkIk2YhmTQL
  yaQFjCyrGM2SijLTM0pyEzNzdA0NDHQNDY10TXQNTY31Eqt0k/VKi3VTE4tLdA31EsuL9Yorc
  5NzUvTyUks2MQKjJ6WAZeYOxrY3H/QOMUpyMCmJ8k69dCFeiC8pP6UyI7E4I76oNCe1+BCjDA
  eHkgTvtmdAOcGi1PTUirTMHGAkw6QlOHiURHj3gKR5iwsSc4sz0yFSpxgVpcR57z0FSgiAJDJ
  K8+DaYMnjEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3lMgU3gy80rgpr8CWswEtJjn0nmQ
  xSWJCCmpBqbQfu68r23bHrx8nu12xPdN5a07X5r/sFqy7o/y35X0qnGVyu7NHe51qhdMgtvio
  tpTXU+9vvuRQ5BB8HhNW2ocS9tmhzWBDmd8vMufXLha/8LjlYfUduajKjJdXQ2LRNSebjt1IC
  j6r4/sjrkH4/f/E+Ni3rjk7vXe+SG+auJvjN5/SZu5nstDu7LwpPV/t+dn98be6N/QcF1x7dG
  aj4+83HP/GqXknQmewsrmqjZbZX1VwUcz/qqHL122OK46J1VaqNWs3fP41KKatZwSFvuDX7of
  Pl74c5aXRNlez/iNzTxP1sg+9gz4/oyRa6WCw/5dc/UW/pXW0nVRWn9mdsYk1wDtZ8o/Df/Z6
  wRdY1RiKc5INNRiLipOBAAZFfAPmQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-415.messagelabs.com!1607526267!80840!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21445 invoked from network); 9 Dec 2020 15:04:29 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-4.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Dec 2020 15:04:29 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id D2755ED5D3E749A687E0;
        Wed,  9 Dec 2020 23:04:25 +0800 (CST)
Received: from localhost.localdomain (10.38.54.222) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Wed, 9 Dec 2020
 07:04:23 -0800
Subject: Re: [External] linux-next: build failure after merge of the pm tree
To:     Jonathan Corbet <corbet@lwn.net>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201209205754.41ac2424@canb.auug.org.au>
 <203934b6-dd68-b02d-757f-c0336352d397@lenovo.com>
 <20201209073352.178d5027@lwn.net>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <8e670c7b-b7e7-80aa-343b-4e9d429b61ec@lenovo.com>
Date:   Wed, 9 Dec 2020 10:04:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209073352.178d5027@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.54.222]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jon,

On 09/12/2020 09:33, Jonathan Corbet wrote:
> On Wed, 9 Dec 2020 08:56:31 -0500 Mark Pearson
> <markpearson@lenovo.com> wrote:
> 
>> I do see: WARNING: document isn't included in any toctree but I
>> think this is benign - I believe I'm getting it just because I 
>> converted the file to .rst (as requested by Andy Shevchenko). If
>> this is important and needs to be addressed urgently as well let me
>> know.
> 
> Normally this is solved by adding the newly created document to the 
> index.rst file in the same directory.
> 
> There isn't one in Documentation/ABI/testing, though; in fact, there
> are no RST files there.  Files in Documentation/ABI are in a special
> format that is processed into RST during the docs build.  If we want
> to add information outside of any specific ABI entry there, we're
> going to have to decide how we want to do that.  It may well be,
> though, that the introductory information just belongs in the admin
> guide instead.
> 

Should I just revert this file to plain text format?

I converted it to rst (as was requested) but I'm wondering if I'm just
causing a bunch of headaches and people are going to be cursing the one
weird random rst file in that directory going forwards :)

Mark
