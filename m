Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064232FA826
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 19:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407402AbhARR7q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 12:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39214 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407401AbhARR7b (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 12:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610992681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vm9rIUiGAkv8j7m5tGjVI7arm5LRraDLYgpQsMq2H+k=;
        b=BLP9QI4xoPrXBfF3YCKyaDkIW4zMiHDV2StiJ5r9cQ0t8qMISu/hkY14AWBAZ0L16VW6Bg
        tdVQ1iN8fblhk8PK34cQvEcV9uOclf961oPfADCbLX0UbP/IatTR9MXa5dEX9swZB+uFiR
        Wz3gUH1KKMFbZTH+g3pWiqIwqQV1oKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24--UUlcuZ6NJmiB_Ji_P4jnA-1; Mon, 18 Jan 2021 12:55:22 -0500
X-MC-Unique: -UUlcuZ6NJmiB_Ji_P4jnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 240F4107ACE3;
        Mon, 18 Jan 2021 17:55:21 +0000 (UTC)
Received: from treble (ovpn-116-102.rdu2.redhat.com [10.10.116.102])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 20A9027CB4;
        Mon, 18 Jan 2021 17:55:18 +0000 (UTC)
Date:   Mon, 18 Jan 2021 11:55:12 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Jan 18 (objtool: 2 warnings)
Message-ID: <20210118175512.jffm2pjarsbavtqb@treble>
References: <20210118174853.4be516ca@canb.auug.org.au>
 <4e0c0222-c413-8389-ba8b-572041f81eb0@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e0c0222-c413-8389-ba8b-572041f81eb0@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 18, 2021 at 09:16:14AM -0800, Randy Dunlap wrote:
> On 1/17/21 10:48 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210115:
> > 
> 
> on x86_64:
> 
> lib/iov_iter.o: warning: objtool: iovec_from_user()+0x157: call to __ubsan_handle_add_overflow() with UACCESS enabled
> fs/select.o: warning: objtool: do_sys_poll()+0x669: call to __ubsan_handle_sub_overflow() with UACCESS enabled

Under discussion:

  https://lkml.kernel.org/r/590998aa9cc50f431343f76cae72b2abf8ac1fdd.1608699683.git.jpoimboe@redhat.com

-- 
Josh

