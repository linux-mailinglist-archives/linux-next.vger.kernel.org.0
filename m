Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341856F9112
	for <lists+linux-next@lfdr.de>; Sat,  6 May 2023 12:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjEFKDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 6 May 2023 06:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjEFKDK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 6 May 2023 06:03:10 -0400
X-Greylist: delayed 1397 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 06 May 2023 03:03:06 PDT
Received: from mail.quimbiotec.gob.ve (mail.quimbiotec.gob.ve [201.249.143.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA1ECE7;
        Sat,  6 May 2023 03:03:06 -0700 (PDT)
Received: from localhost (mail.quimbiotec.gob.ve [127.0.0.1])
        by mail.quimbiotec.gob.ve (Postfix) with ESMTP id 26AC61203B39;
        Sat,  6 May 2023 05:34:10 -0400 (-04)
Received: from mail.quimbiotec.gob.ve ([127.0.0.1])
        by localhost (mail.quimbiotec.gob.ve [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id q5jzUeE8fCV4; Sat,  6 May 2023 05:34:09 -0400 (-04)
Received: from localhost (mail.quimbiotec.gob.ve [127.0.0.1])
        by mail.quimbiotec.gob.ve (Postfix) with ESMTP id 826ED1203B1A;
        Sat,  6 May 2023 05:34:09 -0400 (-04)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.quimbiotec.gob.ve 826ED1203B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quimbiotec.gob.ve;
        s=695D21C2-253C-11ED-BDFF-C79B274D8774; t=1683365649;
        bh=RRRnP4RIsEwCVthsZM6x7wu40KXcDhaHAXW+GEcnQQQ=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=zKn5adZqn5/9inNxOi3NZadd4dOrMRijbWpoS7lb/rF/2uazd3ZZKXu+pXKf2vpKF
         /9CwIFGC8pBhmtM27gs4wEuaGVXQ42ns1jOjQNl6p9wJYYPZT2TbX61KLzQ4eKeJ/q
         dBx9FL8NPtgKb5cbBDSnnb7e07nBmbgXnGz/sWklUN7FBvSb/i3lI/V7YXKm9CVdys
         vh8HjYle4p97kVhCGH3GpzvHmPErdkxLOF7L4kg+b5iKF2CkvoRaCA0k0FjHonsuUM
         Hl+v3hP5FI29rUtmhM51aLu3ZxzlNihjeoJZAXWzyY9ph1qoIjFno76m49EX0mzow3
         n4Q+Axd3nCkAw==
X-Virus-Scanned: amavisd-new at quimbiotec.gob.ve
Received: from mail.quimbiotec.gob.ve ([127.0.0.1])
        by localhost (mail.quimbiotec.gob.ve [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id T5eA_0TvaulF; Sat,  6 May 2023 05:34:09 -0400 (-04)
Received: from [192.168.8.101] (unknown [154.120.79.87])
        by mail.quimbiotec.gob.ve (Postfix) with ESMTPA id 4C106120335A;
        Sat,  6 May 2023 05:33:51 -0400 (-04)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: FOR YOU:(ACTION REQUESTED)
To:     Recipients <sdeboer@quimbiotec.gob.ve>
From:   "Scarlet De Boer" <sdeboer@quimbiotec.gob.ve>
Date:   Sat, 06 May 2023 02:33:32 -0700
Reply-To: captainthomaz.1@gmail.com
Message-Id: <20230506093352.4C106120335A@mail.quimbiotec.gob.ve>
X-WatchGuard-Spam-ID: RefID Error [Failed to get a SPAM score (1)]
X-WatchGuard-Spam-Score: 0, clean; 0, no virus
X-WatchGuard-Mail-Client-IP: 127.0.0.1
X-WatchGuard-Mail-From: sdeboer@quimbiotec.gob.ve
X-WatchGuard-Mail-Recipients: linux-next@vger.kernel.org;linux-s390@vger.kernel.org
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_50,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_H2,RCVD_IN_MSPIKE_ZBI,SPF_HELO_NONE,
        SPF_NONE,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Dear ,

Can I have your attention?I seek your attention for possible partnership th=
at works, you won't spend money to this project. Reply and and my boss (tho=
mas Graig) will contact for update.

Scarlet De Boer
PA, Thomas Graig
