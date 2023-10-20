Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAA87D0A80
	for <lists+linux-next@lfdr.de>; Fri, 20 Oct 2023 10:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376433AbjJTI0r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Oct 2023 04:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376449AbjJTI0q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Oct 2023 04:26:46 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D356C2
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 01:26:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D46E62199E;
        Fri, 20 Oct 2023 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1697790402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kFNzC9O8N45/IzwJz7+W0LBfnbs4cbK7EXNxssaZJ/Q=;
        b=C+QUDTn9yJMM6NOl6QmFNc40chGEwwaLWTg6ElIBHs3iI3P+gXb5xiTzFFv3TNJcVvwnSg
        /3neT5RNGHHEYp+RIL0LrNvDg/voiegrlScHLAD+wtHWsP+8QbXnXXMEo1RUb7DQPyBZ0d
        tfu6bL5a7aRaGQmm0EL6+1C6K53JF/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1697790402;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kFNzC9O8N45/IzwJz7+W0LBfnbs4cbK7EXNxssaZJ/Q=;
        b=V1Ypp6JujRu89/pWhXjjZzeK7b+/5VN2K69oovXZz0c5uvXUjKiSx1iILszVO8RlNnXc4S
        wYHf1eZuIB84j8Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78D02138E2;
        Fri, 20 Oct 2023 08:26:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +NSyGcI5MmWnIgAAMHmgww
        (envelope-from <jroedel@suse.de>); Fri, 20 Oct 2023 08:26:42 +0000
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: Upcoming merge conflict between s390 fixes and iommu trees
From:   =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
In-Reply-To: <your-ad-here.call-01697728651-ext-4593@work.hours>
Date:   Fri, 20 Oct 2023 10:26:29 +0200
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D650B3E-5E4D-406E-B5B5-E9135B97696B@suse.de>
References: <your-ad-here.call-01697728651-ext-4593@work.hours>
To:     Vasily Gorbik <gor@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
Authentication-Results: smtp-out1.suse.de;
        none
X-Spam-Level: 
X-Spam-Score: -7.72
X-Spamd-Result: default: False [-7.72 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         BAYES_HAM(-0.96)[86.66%];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         MV_CASE(0.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLY(-4.00)[];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         TO_DN_ALL(0.00)[];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         R_MIXED_CHARSET(0.83)[subject];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Vasily,

> Am 19.10.2023 um 17:17 schrieb Vasily Gorbik <gor@linux.ibm.com>:
>=20
> The latter commit removes arch/s390/pci/pci_dma.c, so that's
> the way to go for the conflict resolution. Joerg, I believe it's your
> decision whether you would like to mention this trivial merge conflict =
in
> your pull request to Linus later.

Thanks for the heads-up, I will probably resolve that in my merge-commit =
that will be the iommu/next branch, so upstream shouldn=E2=80=99t =
notice. I guess the fix will be in rc7?

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=C3=9Fe 146
90461 N=C3=BCrnberg
Germany

Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, =
Boudien Moerman
(HRB 36809, AG N=C3=BCrnberg)
