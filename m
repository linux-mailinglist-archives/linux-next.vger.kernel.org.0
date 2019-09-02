Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08EC0A5E09
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 01:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfIBXUL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 2 Sep 2019 19:20:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47092 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbfIBXUL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 19:20:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CDAFF85543;
        Mon,  2 Sep 2019 23:20:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AF96C5D9CC;
        Mon,  2 Sep 2019 23:20:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190903090722.556b66ba@canb.auug.org.au>
References: <20190903090722.556b66ba@canb.auug.org.au> <20190902161935.78bf56f1@canb.auug.org.au> <20190829153116.7ffc7470@canb.auug.org.au> <16836.1567440079@warthog.procyon.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22425.1567466408.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date:   Tue, 03 Sep 2019 00:20:08 +0100
Message-ID: <22426.1567466408@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 02 Sep 2019 23:20:10 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > static inline void post_usb_device_notification(const struct usb_device *udev,
> > 						unsigned int subtype, u32 error) {}
> 
> But not published, yet?

I was hoping to get the smack patch reviewed by Casey first, but I can
publish anyway.

> > > I then discovered that I needed to install libkeyutils-dev :-( but it
> > > built OK after that.  
> > 
> > ?  The kernel shouldn't require that to build.
> 
> I was doing an x86_64 allmodconfig build which seems to build (all of?)
> the samples.

Ah, yes - the sample demonstrates the key/keyring notifications as well as USB
and block notifications and requires a constant from the keyutils-devel
package.  Maybe I should get it from the kernel UAPI headers instead, but that
risks generating a collision.

David
