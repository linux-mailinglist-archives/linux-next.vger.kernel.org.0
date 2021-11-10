Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1945144BCB3
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 09:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhKJIUd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Nov 2021 03:20:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:36066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229791AbhKJIUc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Nov 2021 03:20:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA39E61077;
        Wed, 10 Nov 2021 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636532265;
        bh=paSp9h4l6mtUom1KRr5x8WCqOZmhDbnqIvrmF41Gm/A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RRpWkSAbF024szt0ZjJIn6S6cqIpsV1Bp31ej2PoJKg2BSIs3O+adctI+tdwf2vur
         mHbyKe7e6Lkze5+KnSY/S02scyuvoVFVRD4k/bJGBxtXOtqxEtD7WCQENHHgpk4+7s
         vLuVUeuRY02rJNjSe6hxHDvzx1u5/TqEcO38x6Il5n7qlqTcSyjD9UcSLgGONAnwXZ
         5YPFPzmA9cs4FXZC8HbsfAl+I00qCnYYT2DsOyf2fU83CGkj2AgY5tAZRJvXe8k/rs
         vhGMtV/ASauR19kdIJ9kDTW6Kn8oACOlqqDHzKy1qcsXAs7oei52gmViuFAbEmoVsJ
         TZIs3NhtH52OQ==
Date:   Wed, 10 Nov 2021 09:17:42 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hid tree
In-Reply-To: <20211110150639.7db57ae2@canb.auug.org.au>
Message-ID: <nycvar.YFH.7.76.2111100915550.12554@cbobk.fhfr.pm>
References: <20211110150639.7db57ae2@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 10 Nov 2021, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the hid tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/linux/mod_devicetable.h:909: warning: Function parameter or member 'guid' not described in 'ishtp_device_id'
> 
> Introduced by commit
> 
>   fa443bc3c1e4 ("HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()")
> 
> I also notice that there is a @context description, but no field.

Thanks for spotting it. The kerneldoc is clearly wrong there both on the 
'guid' member name, and also the description (mind the '36 char' part, 
where it should have been '16 char' instead).

Thomas, could you please send me a fixup patch for that?

Thanks,

-- 
Jiri Kosina
SUSE Labs

