Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98678189ADD
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 12:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgCRLlN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 07:41:13 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:56844 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726894AbgCRLlN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 07:41:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 0F1E2FB03;
        Wed, 18 Mar 2020 12:41:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OTVONGkV4vui; Wed, 18 Mar 2020 12:41:10 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 8E411412BE; Wed, 18 Mar 2020 12:41:09 +0100 (CET)
Date:   Wed, 18 Mar 2020 12:41:09 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Roman Gushchin <guro@fb.com>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: linux-next build failure on arm64 with CMA but !NUMA
Message-ID: <20200318114109.GA65068@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Roman,
882d60d2ce725381236a158204d7ec13ff19ab25 in linux-next broke compilation
on arm64 CMA && !NUMA like

  CC      kernel/irq/irqdesc.o
mm/hugetlb.c: In function ‘hugetlb_cma_reserve’:
mm/hugetlb.c:5449:3: error: implicit declaration of function ‘for_each_mem_pfn_range’; did you mean ‘for_each_mem_range’? [-Werror=implicit-function-declaration]
   for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
   ^~~~~~~~~~~~~~~~~~~~~~ 
   for_each_mem_range
mm/hugetlb.c:5449:61: error: expected ‘;’ before ‘{’ token
   for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
                                                             ^~
Reverting that fixes the build for the moment. Would making all of this
dependent on CMA && NUMA be the right fix?
Cheers,
 -- Guido

