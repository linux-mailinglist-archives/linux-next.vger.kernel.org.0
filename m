Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DB042EBF2
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 10:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhJOIYB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 04:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237157AbhJOIXX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Oct 2021 04:23:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABFF4611C3;
        Fri, 15 Oct 2021 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634286077;
        bh=iv9RjJ5usKr1aqzsketYnXHlvPbKxOIgR2sNlSh8uyU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=N79n44Zd84g7Jb0bzViD1qnhQRdkkjQnfD0lqJp0PR8mzlLW4q4rS35pxkVDuiWgR
         Os6YhQcFDd52jDxPLE0prfn/1Esv80/ZbP+RdNQTo0PqnsLeaZrOEZ+11ZbKuy1/Bk
         TnJ7i/whJZHq/gotlKuW7GFQjLRs2NvQFs/i2G32vv6WcGBRG7XwSCf7LJd1zdA3D1
         +GAjM3+Ms4R686jW2YNMfEdyShSToOQ7E9bDkcUnRo1TN7DMDz4AS/LQMNGvPlevhE
         1o5fcLBUx36fmZjrmrvdQZwYAw3GA2TisCmyncX7Zl+GDjB+9xouJcNxNaItqg3yB9
         2Me5q4/uUjx4A==
Message-ID: <80d4207901681611ebfeb0c2e5d8743b94802ecf.camel@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Fri, 15 Oct 2021 10:21:13 +0200
In-Reply-To: <a1f2f236-73ea-2459-63bc-8f51ae0231b2@gmail.com>
References: <20211015092934.726ed2d4@canb.auug.org.au>
         <a1f2f236-73ea-2459-63bc-8f51ae0231b2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2021-10-14 at 16:21 -0700, Florian Fainelli wrote:
> On 10/14/21 3:29 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commits
> > 
> >   3f3247285461 ("ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address")
> >   13dbc954b3c9 ("ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting")
> > 
> > are missing a Signed-off-by from their committer.
> 
> Yes that is because I had to rewrite Nicolas' Author email to match his
> Signed-off-by and in the process I became the committer and did not add
> my Signed-off-by.
> 
> Nicolas, the commits you had submitted to me originally used your
> @redhat.com emails in the Author/From, whereas the Signed-off-by used
> your @kernel.org address. Can you have both match for next commits?

Noted, sorry for that!

Regards,
Nicolas

