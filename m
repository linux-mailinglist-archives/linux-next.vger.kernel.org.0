Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5AC0142F08
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 16:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgATPwZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 10:52:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45290 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726626AbgATPwY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 10:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579535543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=siJ2sfjzWDacIjNlyKFxd2oMlncO7B3hkvb0Wjp0h7Y=;
        b=dJ0DR4T30jcCK+PeV/MYoN4HJAwe+omtpJ4nFGPLVzve3DIvkboD31IYZv40Z+WEDu8h7Z
        Pz0o7BVvK/HZjAF3OkDSGV7k0YO7HU5gah53nxxapg7erYnq4FpqOon66f1VRU2twokHiY
        LdA3JfFp1JDGLwA589Gjf/GpY0X/TbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-wXNF9myXPlCSEOjSfBcqig-1; Mon, 20 Jan 2020 10:52:22 -0500
X-MC-Unique: wXNF9myXPlCSEOjSfBcqig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27FAB800D41;
        Mon, 20 Jan 2020 15:52:21 +0000 (UTC)
Received: from treble (ovpn-125-19.rdu2.redhat.com [10.10.125.19])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C87360BF7;
        Mon, 20 Jan 2020 15:52:20 +0000 (UTC)
Date:   Mon, 20 Jan 2020 09:52:17 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Dec 6 (objtool, lots in btrfs)
Message-ID: <20200120155217.ikvlphvlaswh3twt@treble>
References: <20191206135406.563336e7@canb.auug.org.au>
 <cd4091e4-1c04-a880-f239-00bc053f46a2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd4091e4-1c04-a880-f239-00bc053f46a2@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 06, 2019 at 08:17:30AM -0800, Randy Dunlap wrote:
> On 12/5/19 6:54 PM, Stephen Rothwell wrote:
> 
> kernel/cred.o: warning: objtool: prepare_creds()+0x2c3: unreachable instruction

Here's another one I haven't recreated yet - if you can share the .o and
the config that would be helpful.

-- 
Josh

