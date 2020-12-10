Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D2E2D4F67
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 01:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgLJA0B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 19:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgLJAZu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 19:25:50 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBC2C0613D6
        for <linux-next@vger.kernel.org>; Wed,  9 Dec 2020 16:25:10 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B628630D;
        Thu, 10 Dec 2020 00:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B628630D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607559862; bh=6wPAN3dj7RMCXqKk9fIHTDje+AdbVckZGEGslGnww7c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sAQptInUiKe6ee22FDtu/3rOO4hzk4Q1bQky7GOQvG1RTMw2S862YlkkF6KbKb/ve
         WceIDltpgQBJrCoHAIAkttQDEyMHT1PwYE2GRf6rVwa4FQRlapfAufYfkNgNvAmNH/
         3KJ7fnrb915EpyNDJduJmlpItDpn6S+6o7HflokJnalK9aNC8toxmNikC4STmDvk7a
         dtJbfpjlvPosAM0QPHMeKqNA0TGu5nwmpHumx0JWXVMYwXkEe9EJukmJcB5fckhKrB
         rkCi71QXCdT5i5cq6SCCGpyiRIMQ1HW7aIeqMuc089ZZoSzCRQlBs1hkto6ntw/KcD
         /chqXT2k3bHJw==
Date:   Wed, 9 Dec 2020 17:24:20 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [External] linux-next: build failure after merge of the pm tree
Message-ID: <20201209172420.7f7ef4fa@lwn.net>
In-Reply-To: <8e670c7b-b7e7-80aa-343b-4e9d429b61ec@lenovo.com>
References: <20201209205754.41ac2424@canb.auug.org.au>
        <203934b6-dd68-b02d-757f-c0336352d397@lenovo.com>
        <20201209073352.178d5027@lwn.net>
        <8e670c7b-b7e7-80aa-343b-4e9d429b61ec@lenovo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 9 Dec 2020 10:04:22 -0500
Mark Pearson <markpearson@lenovo.com> wrote:

> On 09/12/2020 09:33, Jonathan Corbet wrote:
> > On Wed, 9 Dec 2020 08:56:31 -0500 Mark Pearson
> > <markpearson@lenovo.com> wrote:
> >   
> >> I do see: WARNING: document isn't included in any toctree but I
> >> think this is benign - I believe I'm getting it just because I 
> >> converted the file to .rst (as requested by Andy Shevchenko). If
> >> this is important and needs to be addressed urgently as well let me
> >> know.  
> > 
> > Normally this is solved by adding the newly created document to the 
> > index.rst file in the same directory.
> > 
> > There isn't one in Documentation/ABI/testing, though; in fact, there
> > are no RST files there.  Files in Documentation/ABI are in a special
> > format that is processed into RST during the docs build.  If we want
> > to add information outside of any specific ABI entry there, we're
> > going to have to decide how we want to do that.  It may well be,
> > though, that the introductory information just belongs in the admin
> > guide instead.
> >   
> 
> Should I just revert this file to plain text format?
> 
> I converted it to rst (as was requested) but I'm wondering if I'm just
> causing a bunch of headaches and people are going to be cursing the one
> weird random rst file in that directory going forwards :)

No, not quite; stuff in the ABI directory should be in the special format
used there.  You're partway there, but the free text outside of the
entries itself doesn't belong there.  I'd split the file, moving the free
text to an RST file, probably in the admin guide.  The actual ABI entry
information stays in the file you've added now. 

Thanks,

jon
