Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31070FE2F6
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 17:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfKOQij (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 11:38:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22387 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727531AbfKOQij (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 11:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573835917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6fENKbkRp6IkVJsqfQWI1tPw8ogr4wWzSPjFy8i7mms=;
        b=ItJshpStFRX1cWzQp3Ayyvb1GjvrfKoyYPDDPnRpAsZu7L1ncHbS+Mbw2c2abDBHh3kS41
        INIpjmpQh2kKnqfe+D+tcGKJLD4g9vUa9W7ddsbfYK3mpXYmAM959IIUkz5/bNuci5db4m
        l/FTqXlTvSdGluI9GuTb9U4+9wcrKbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-hWEbCo_AMMG0C_3DEUsPiQ-1; Fri, 15 Nov 2019 11:38:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 622D1107ACFA;
        Fri, 15 Nov 2019 16:38:33 +0000 (UTC)
Received: from treble (ovpn-120-26.rdu2.redhat.com [10.10.120.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 98BED60FC1;
        Fri, 15 Nov 2019 16:38:32 +0000 (UTC)
Date:   Fri, 15 Nov 2019 10:38:30 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Nov 15 (objtool)
Message-ID: <20191115163830.g262y75w3sh535fm@treble>
References: <20191115190525.77efdf6c@canb.auug.org.au>
 <c49752fe-4b47-2329-2cb8-caad44803e3a@infradead.org>
MIME-Version: 1.0
In-Reply-To: <c49752fe-4b47-2329-2cb8-caad44803e3a@infradead.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: hWEbCo_AMMG0C_3DEUsPiQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 08:02:30AM -0800, Randy Dunlap wrote:
> On 11/15/19 12:05 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20191114:
> >=20
>=20
> on x86_64:
>=20
> already reported and Josh supplied a fix (yet unmerged),
> but this is still around:
>=20
> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable=
 instruction

My apologies, I have a growing backlog of objtool fixes which I hope to
post next week.

>=20
> new AFAIK:
>=20
> drivers/gpu/drm/bridge/cdns-dsi.o: warning: objtool: cdns_dsi_bridge_enab=
le()+0x3e0: unreachable instruction
>=20
> obj file for latter one is attached.

This seems fishy.  cdns_dsi_init_link() never returns, it always dies a
with UD2.  I bet GCC decided that it always does a divide-by-zero, and
so it forces a crash as a result.  Will try to dig deeper next week...

--=20
Josh

