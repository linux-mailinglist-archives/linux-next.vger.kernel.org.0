Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEAE714F15C
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 18:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgAaRf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jan 2020 12:35:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35262 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726912AbgAaRf1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jan 2020 12:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580492126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a+dgvjmZL1Am8SwTNXtC3xi/4UF0VAsvDkpYJZdr/1w=;
        b=ICNfGwLe+/uNXjSxCO8nsSR8QS8ybRNixtDR8J+/LendKec5aOkEJCRvUwUoLxgfEZX5Iw
        XBGlgGqP1L1pd112uaA/qaWwVQWrX/SdPDEAtygwC1AbDaYpreNk9WF3+oMGlrHEotPu1d
        mtiwfXWP2ReHuD/g1qC97oWYUPLx674=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-zBt8VshqNJmmOhFbxUnxBw-1; Fri, 31 Jan 2020 12:35:13 -0500
X-MC-Unique: zBt8VshqNJmmOhFbxUnxBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B480A8017CC;
        Fri, 31 Jan 2020 17:35:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com [10.10.120.218])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 28F8160BE0;
        Fri, 31 Jan 2020 17:35:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <3ac1c817-b310-c8f8-6990-1602db540106@schaufler-ca.com>
References: <3ac1c817-b310-c8f8-6990-1602db540106@schaufler-ca.com> <20200129155431.76bd7f25@canb.auug.org.au> <e66a563e-b612-c5b6-7bdd-b55113a9b822@infradead.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     dhowells@redhat.com, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>
Subject: Re: linux-next: Tree for Jan 29 (security/smack/)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <266824.1580492109.1@warthog.procyon.org.uk>
Date:   Fri, 31 Jan 2020 17:35:09 +0000
Message-ID: <266825.1580492109@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Casey Schaufler <casey@schaufler-ca.com> wrote:

> This keeps coming up. It's in David Howells' watch queue changes.
> David, could you please fix this?

That should be fixed now in my keys-next branch.

David

