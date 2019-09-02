Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA04A5E45
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 01:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfIBXvx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 19:51:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43142 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726828AbfIBXvx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 19:51:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 97E74C057F20;
        Mon,  2 Sep 2019 23:51:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 684E019C78;
        Mon,  2 Sep 2019 23:51:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190903093943.5ed397a2@canb.auug.org.au>
References: <20190903093943.5ed397a2@canb.auug.org.au> <20190903090722.556b66ba@canb.auug.org.au> <20190902161935.78bf56f1@canb.auug.org.au> <20190829153116.7ffc7470@canb.auug.org.au> <16836.1567440079@warthog.procyon.org.uk> <22426.1567466408@warthog.procyon.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <14511.1567468311.1@warthog.procyon.org.uk>
Date:   Tue, 03 Sep 2019 00:51:51 +0100
Message-ID: <14512.1567468311@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 02 Sep 2019 23:51:53 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Ah, yes - the sample demonstrates the key/keyring notifications as well as
> > USB and block notifications and requires a constant from the
> > keyutils-devel package.  Maybe I should get it from the kernel UAPI
> > headers instead, but that risks generating a collision.
> 
> What sort of collision?

Accidentally including both a userspace header file and a kernel UAPI header
file with the constants colliding.

Anyway, I've pushed a new version of keys-next and also keyutils if you're
employing the testsuite from that at all.

David
