Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EAB1D0301
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 01:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgELX0T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 19:26:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55982 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELX0T (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 19:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589325978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Nf5ipnL8n4hf1p58tjMDHcZBfdQ1O05mmKF1dowfL7w=;
        b=E80Vf0y5Wx7n5d3/X4MZvN6OwSfTfxL+xbYjISW//BX80lJbHPSgnzn7CYje7XF/FXmePC
        3MPy/xmgpfQ+Jhk2o32HxvN4abuGkjzP0fujXknluG26YBeqSDv1ekKHEOXWQIDemc4vrx
        SYwoh+q7pWV4+2BLH9Cp5FCGW0Mtu7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-AdvI7pp6PsSxAQTwcjoQnQ-1; Tue, 12 May 2020 19:26:16 -0400
X-MC-Unique: AdvI7pp6PsSxAQTwcjoQnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E331841920;
        Tue, 12 May 2020 23:26:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com [10.10.112.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 17C987529C;
        Tue, 12 May 2020 23:26:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAK7LNAQ-=A0nDZK0FTzgJ6oJ-VbV33F1rVjvBAWgybSsUXaPVA@mail.gmail.com>
References: <CAK7LNAQ-=A0nDZK0FTzgJ6oJ-VbV33F1rVjvBAWgybSsUXaPVA@mail.gmail.com> <20200512195712.690f02bb@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fsinfo tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2960968.1589325972.1@warthog.procyon.org.uk>
Date:   Wed, 13 May 2020 00:26:12 +0100
Message-ID: <2960969.1589325972@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> BTW, why is '-static' needed here?

Sorry, that was a leftover.  I've been building it on one version of Fedora
and running it on my test machine - which is a couple of versions behind.  I
really need to do an update.  Anyway, I've removed it and -lm.

David

