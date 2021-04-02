Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE0A352E19
	for <lists+linux-next@lfdr.de>; Fri,  2 Apr 2021 19:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbhDBRSQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Apr 2021 13:18:16 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:54980 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbhDBRSP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Apr 2021 13:18:15 -0400
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 2.0.3)
 id b6f057814a45bb33; Fri, 2 Apr 2021 19:18:12 +0200
Received: from kreacher.localnet (89-64-80-75.dynamic.chello.pl [89.64.80.75])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id 42E5A6690CC;
        Fri,  2 Apr 2021 19:18:12 +0200 (CEST)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the pm tree
Date:   Fri, 02 Apr 2021 19:18:11 +0200
Message-ID: <2597122.mvXUDI8C0e@kreacher>
In-Reply-To: <87czvfu9j5.fsf@vitty.brq.redhat.com>
References: <20210331112945.11aa88f5@canb.auug.org.au> <87czvfu9j5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 89.64.80.75
X-CLIENT-HOSTNAME: 89-64-80-75.dynamic.chello.pl
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiiedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdejlefghfeiudektdelkeekvddugfeghffggeejgfeukeejleevgffgvdeluddtnecukfhppeekledrieegrdektddrjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeelrdeigedrkedtrdejhedphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqedprhgtphhtthhopehvkhhuiihnvghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghu
X-DCC--Metrics: v370.home.net.pl 1024; Body=4 Fuz1=4 Fuz2=4
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wednesday, March 31, 2021 8:22:54 AM CEST Vitaly Kuznetsov wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi all,
> >
> > After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> >
> > drivers/acpi/processor_idle.c: In function 'acpi_idle_play_dead':
> > drivers/acpi/processor_idle.c:542:15: warning: extra tokens at end of #ifdef directive
> >   542 | #ifdef defined(CONFIG_X86) && defined(CONFIG_HOTPLUG_CPU)
> >       |               ^
> >
> 
> Sigh, smaller the patch, more iterations it will take to make it
> right....
> 
> Rafael,
> 
> something went wrong when you folded in my "[PATCH] ACPI: processor: Fix
> build when !CONFIG_HOTPLUG_CPU" here. This line should be:
> 
> #if defined(CONFIG_X86) && defined(CONFIG_HOTPLUG_CPU)

Right, my mistake, sorry.  Fixed yesterday.

Thanks!



