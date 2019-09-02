Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C4EA5AF1
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 18:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfIBQBW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 12:01:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55102 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfIBQBW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 12:01:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CBC20301E11C;
        Mon,  2 Sep 2019 16:01:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 589CE600D1;
        Mon,  2 Sep 2019 16:01:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190902161935.78bf56f1@canb.auug.org.au>
References: <20190902161935.78bf56f1@canb.auug.org.au> <20190829153116.7ffc7470@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16835.1567440079.1@warthog.procyon.org.uk>
Date:   Mon, 02 Sep 2019 17:01:19 +0100
Message-ID: <16836.1567440079@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 02 Sep 2019 16:01:21 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> The forward declararion doesn't seem to work (at laste for the
> !CONFIG_USB_NOTIFICATIONS case.

In the !CONFIG_USB_NOTIFICATIONS case, the argument is to a stub inline
function.  Even though the argument isn't actually used, it can't be an
undefined type - and, I'm guessing, an undefined size, meaning the compiler
doesn't know how many registers/how much stack space it would occupy before
getting to the error argument.

I have a fix for this in my tree that just makes it an unsigned int in the
disabled case:

static inline void post_usb_device_notification(const struct usb_device *udev,
						unsigned int subtype, u32 error) {}

> +#include <linux/watch_queue.h>

I was trying to avoid that if I could to avoid introducing the possibility of
circular deps, but that might not be a problem in this case.

> I then discovered that I needed to install libkeyutils-dev :-( but it
> built OK after that.

?  The kernel shouldn't require that to build.

David
