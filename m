Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18F5142051
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 23:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgASWCg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 17:02:36 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:52794 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbgASWCf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2020 17:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s7rnapALkocYuGpPU7BNCPSg8c2Zf+5ywHOGUWObJQQ=; b=HlCxnC2RDqup9VGr0k+YNkHXX
        O9T5UpS6DF2GbP5Buu//bhmQQgV6GJFB+g5dixq/ev7GgQ5vLVGoDIlHVYZQDCQo+h2Ir5JwwV8V5
        5RBE65ajUuL+VK5HcLV7xjjf4wfFQK63kxLHJRhIlihsGJMc7ws9vICNd5F/ZdgI1JtNywyYMZyZK
        IUdS9eRh9wDVDLFPsKFz4w42UO0yJfIC3J4v7hxZ4S/KpEEIdkLrhhFIjyjh+J39FUmyjo0NJ3+OI
        p1VDBgFTM+r3vxQWlMz9CSUThMa3bbnrotuQLjEHvBdHeRDz6ltL5ymojf+yrmyLbYZ2+ZwI1ADDv
        kNty7tT/A==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:57150)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1itIeN-0002F8-P9; Sun, 19 Jan 2020 22:02:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1itIeM-0002BY-BX; Sun, 19 Jan 2020 22:02:30 +0000
Date:   Sun, 19 Jan 2020 22:02:30 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the arm tree
Message-ID: <20200119220230.GX25745@shell.armlinux.org.uk>
References: <20200120082447.7fea4d55@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120082447.7fea4d55@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Patch dropped.

I think this needs to wait until it's been properly tested before I
apply the next version.

On Mon, Jan 20, 2020 at 08:24:47AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> 
> Caused by commit
> 
>   e3a0e1427dcb ("ARM: 8953/1: decompressor: simplify libfdt builds")
> 
> My arm builds are ppc64le hosted cross compiles using Debian's cross
> gcc package.
> 
> I have reverted that commit for today.
> -- 
> Cheers,
> Stephen Rothwell



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
