Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C49345A10
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 09:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCWIuW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 04:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhCWItv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Mar 2021 04:49:51 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AAAC061574;
        Tue, 23 Mar 2021 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=kbsPmS78osidurfhyEsCqGTXjeqkNyPA34yJVPvtypk=; b=doYhoFzEqp0lu8se+LXqyLMzJd
        LTt0XPBtVH67oSwblyqslDWhv6ohh0cBGC98eNUWwBTNbic830bRjWLypZpwS3bRBuX04m+SOl8+N
        GhBhj0DVKW7x17EBm8+Fd6QO+DDuo+xU+oD/Q/6cslpmncyEFw6xxcEtljwVi9Bo7hCYlI0nwo7u+
        qZtdTDyHaBCYUPLIrobNRUT53myYyKy+2JsQC/pDoH4urAZIrDpvT3+INh0vZi6S22E9+nE7Y0Qn5
        /TjIn0drSlUSqX9evTaOXsmnDq6dldHjrV9/TQefrznCBn6urVtRivU/TbvpP3Up5bvjU8i2Dxzv4
        GKbO0sKQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOcjV-00EMOZ-1L; Tue, 23 Mar 2021 08:49:49 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 571433003E1;
        Tue, 23 Mar 2021 09:49:48 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 331FF23601889; Tue, 23 Mar 2021 09:49:48 +0100 (CET)
Date:   Tue, 23 Mar 2021 09:49:48 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning in Linus' tree
Message-ID: <YFmrrDck8aly/+WS@hirez.programming.kicks-ass.net>
References: <20210323165145.2ae9a0d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210323165145.2ae9a0d2@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 23, 2021 at 04:51:45PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Building Linus' tree, today's linux-next build (x86_64 allnoconfig)
> produced this warning:
>=20
> kernel/static_call.c: In function '__static_call_update':
> kernel/static_call.c:153:18: warning: unused variable 'mod' [-Wunused-var=
iable]
>   153 |   struct module *mod =3D site_mod->mod;
>       |                  ^~~
>=20
> Introduced by commit
>=20
>   698bacefe993 ("static_call: Align static_call_is_init() patching condit=
ion")

Blergh... that's MODULE=3Dn. I'll see if I can find something that's not
too ugly there..
