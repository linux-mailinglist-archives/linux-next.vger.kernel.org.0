Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E955BD588
	for <lists+linux-next@lfdr.de>; Mon, 19 Sep 2022 22:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiISUMN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Sep 2022 16:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiISUMM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2022 16:12:12 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFB2422ED
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 13:12:09 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 97CB1615C9E5;
        Mon, 19 Sep 2022 22:12:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id qE3PUcuV5p9D; Mon, 19 Sep 2022 22:12:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 27B2C615C9E8;
        Mon, 19 Sep 2022 22:12:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SLB-UkZer0J9; Mon, 19 Sep 2022 22:12:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id E59C8615C9E5;
        Mon, 19 Sep 2022 22:12:05 +0200 (CEST)
Date:   Mon, 19 Sep 2022 22:12:05 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-um <linux-um@lists.infradead.org>
Message-ID: <440491920.241014.1663618325760.JavaMail.zimbra@nod.at>
Subject: UML next tree update
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: OPbK7Trs8TTBaZ1HUzdd+daGOFjHPA==
Thread-Topic: UML next tree update
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

please set the UML next trees to:
git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git next
git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git fixes

git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git will be no longer used.

Thanks,
//richard
