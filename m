Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0658E12D1A4
	for <lists+linux-next@lfdr.de>; Mon, 30 Dec 2019 16:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfL3P7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Dec 2019 10:59:45 -0500
Received: from infomag.iguana.be ([185.87.124.46]:39066 "EHLO
        infomag.iguana.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfL3P7p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Dec 2019 10:59:45 -0500
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Dec 2019 10:59:44 EST
Received: by infomag.iguana.be (Postfix, from userid 1001)
        id 8BFEC603CACD; Mon, 30 Dec 2019 16:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 8BFEC603CACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
        s=infomag-20180602; t=1577721218;
        bh=QWQ3dI0bHOs9NF/+MOj7mZ3u9IcPGxtzzLpiEk++eiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=maaN5zSWP4jbllr+f2uYJRCgDUm9SL+J/UO3vU4Wig1xdwS0WARrFkptkOEBcNtSi
         eD2xSoV8kGe/YlehjQCdZmz6qRQyv4wNU/lW1L+fJiUx1sq7R0Zjdvf0OEnnsSmgj4
         fPf1uXYfBWrIis7ieAJLqIHXPct4vlmFxqQX8ekE=
Date:   Mon, 30 Dec 2019 16:53:38 +0100
From:   Wim Van Sebroeck <wim@iguana.be>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the watchdog tree
Message-ID: <20191230155338.GA19493@infomag.iguana.be>
References: <20191221142859.59b88b2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191221142859.59b88b2c@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

> Hi all,
> 
> Commit
> 
>   ad5acedd16f8 ("watchdog: w83627hf_wdt: Fix support NCT6116D")
> 
> is missing a Signed-off-by from its author.
> 
> -- 
> Cheers,
> Stephen Rothwell

Fixed.

Kind regards,
Wim.

