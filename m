Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28D6392950
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 10:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbhE0IP6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 04:15:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235309AbhE0IP5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 May 2021 04:15:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE7C6613AA;
        Thu, 27 May 2021 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622103264;
        bh=tIWaJMEkoaMNgdOKg0JX6sk+BI5+/DenCruKCiODwzY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=fHosN+Wa+2X6Tn9UjIUuQVdHVlPB0jp4e6bRGTTi6Kv3XJHng8ANPQ1ieS2t3t37k
         59/Da/GEAUzapDtE+Esx9Yb0rwCdjjQbK4dTTNSCM01B3E4mz8mRE3XIoBGVJU8+GG
         unqVc3cSCQB9ZfSkg9COEpBblTjycKeur+l/SbuvKw3iycPeRu611V+g6zMPWDdiF7
         z1jzlu4QsDiALtYrHbTCwNpsE7jrjtdN9Em9atA6zxY/KtePyg5sBa5nKbflP5zrt0
         wAhkDLybfYrvy9e3sWPF6PF8UuWfnBlHxJ6O8JYNoeB11h+BKz9+lmXjvGQIgxH7Oz
         JJpPD/Jk5tZdQ==
Date:   Thu, 27 May 2021 10:14:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: build failure after merge of the hid tree
In-Reply-To: <20210527152631.1e70fba2@canb.auug.org.au>
Message-ID: <nycvar.YFH.7.76.2105271012430.28378@cbobk.fhfr.pm>
References: <20210527152631.1e70fba2@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 May 2021, Stephen Rothwell wrote:

> After merging the hid tree, today's linux-next build (x86_64
> modules_install (on an allmodconfig build)) failed like this:
> 
> depmod: ERROR: Cycle detected: hid -> usbhid -> hid
> depmod: ERROR: Found 2 modules in dependency cycles!
> 
> I could not easily figure out what caused this (it may not be the hid
> tree, but probably is), so all I could do was leave it broken.

This is caused by Hans' patches (CCed). I will be dropping those today, as 
the proper fix needs a bit more of rework.

Thanks,

-- 
Jiri Kosina
SUSE Labs

