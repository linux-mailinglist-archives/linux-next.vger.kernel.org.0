Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883C4201DC4
	for <lists+linux-next@lfdr.de>; Sat, 20 Jun 2020 00:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgFSWHF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Jun 2020 18:07:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21512 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728921AbgFSWHE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Jun 2020 18:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592604424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I79nPb0pXt8/3dgBW2qv/EZDlPMjoeNKQYFohhTmzfU=;
        b=cK3eR09sW07j/+aDynDF0VQ5AFFUHARJEXxNQc3rPzCsjOB0VWE1t1ZVPOkbefh/lAWiAY
        G13/a5QWM0jRlUdfWhaEl1SXGgOfQf4pdc51sdsrQBc3kx3qOiYBAFWUuX3NrSI6BpdOZe
        N+iWWbY1248xtXQ+aHBiv6x6C/r1itw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-5Xn1D812ODuWIhY6fMNPMA-1; Fri, 19 Jun 2020 18:07:02 -0400
X-MC-Unique: 5Xn1D812ODuWIhY6fMNPMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3566464;
        Fri, 19 Jun 2020 22:07:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com [10.10.114.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7211271661;
        Fri, 19 Jun 2020 22:06:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <000000000000f48bc805a7f30e6c@google.com>
References: <000000000000f48bc805a7f30e6c@google.com>
To:     syzbot <syzbot+ada89e25a220b3befb36@syzkaller.appspotmail.com>
Cc:     dhowells@redhat.com, linux-afs@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Subject: Re: linux-next test error: KASAN: use-after-free Write in afs_wake_up_async_call
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2213594.1592604418.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 19 Jun 2020 23:06:58 +0100
Message-ID: <2213595.1592604418@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

#syz dup: net-next test error: KASAN: use-after-free Write in afs_wake_up_=
async_call

