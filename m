Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA1E28C172
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 21:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391065AbgJLT0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 15:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389283AbgJLT0o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 15:26:44 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F6BC0613D2
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 12:26:44 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id p2so2557438qtw.16
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6mP0WzDtsUG1tMreO+ygRTccxYSe5bEz62DcBptZem0=;
        b=MospMFqK9viW/4h5N0M3zamKwAi/hBgz1Ky/5OVOqWMSuSdjKgqs190LOY1ClYLOlP
         thNA6jREhGmMs3Yj5I1NrQfzrBPSpijY0E4mMu1rM2wZKedP5CNorNxCpK/ybXgaGce/
         Po/4XSyR4bmF8MwczBsNPs4pfG4+QMIQZvjiCyy/3ON1lYWJ0oAP4OWM29nLVAkFg9Gc
         /zucgxf6Sdvysi8K3lUt76sh9qUNgtLzMJuYj9W2VrCbiYOy0Ul0ihvRzs8stHvq3kgB
         QLdoyEbRbeu4o9FJiOP03C4IGP/FVUruraGX31mTSVewN+yvZDz5GtnkqER1QIGkinc1
         vy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6mP0WzDtsUG1tMreO+ygRTccxYSe5bEz62DcBptZem0=;
        b=VpVX2LWZhyXN2rnx9tH19GtKLo1bHSdhujgjD96PfXP34mjFeus+Hi5h2X5OXTuEpf
         tmPy4lSB8qJk1no1uYeTXkg+CUP/5m00U+TyIicH4/NfmVDfhPR+/STtaZOofEdL8A+C
         zDbp4MwjoLnsOABMTh8zzf+vMbakYL7IFRD7PCiOvETxFZ0kIPezsmoEHY1rxW1WKckb
         rBnxgPe0dLU+JLPEVnUG9YnYTYFUxyfVSgZgJKRcqm1wsHNeX43kDFk1nk0Twz5f2nWd
         gZNnym8J/sNT1cEhHtcRDTdfiV71zA5QUpY4uXHLuKR1/Hzfs+zOLBQp0fuK3Bh64WzN
         oUPA==
X-Gm-Message-State: AOAM530zw8Ux9p+7gWS9lY93Y6NSQmP4lMAQxDVVZMkZDNwHYadEK4FA
        qNnVlEwjt8p0aYu83cVk7OcPZRIG6SpRq+jj5KY=
X-Google-Smtp-Source: ABdhPJzO5rgYO7IUVxVdKCLFmtK2xJSlit9snPEbirs1qP+osmOW+Nv8pB+q9bo4QGLyVayUEBfaXYyIDJltFqADB3g=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:43c6:: with SMTP id
 o6mr17448365qvs.35.1602530803332; Mon, 12 Oct 2020 12:26:43 -0700 (PDT)
Date:   Mon, 12 Oct 2020 12:26:37 -0700
In-Reply-To: <20201012141032.6333-1-cai@redhat.com>
Message-Id: <20201012192637.309661-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20201012141032.6333-1-cai@redhat.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: Re: [PATCH -next] arm64: Fix redefinition of init_new_context()
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     cai@redhat.com
Cc:     arnd@arndb.de, catalin.marinas@arm.com, jean-philippe@linaro.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        npiggin@gmail.com, sfr@canb.auug.org.au, will@kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Our CI went red for -next on arm64 due to c870baeede75. Thanks for sending a
fix.

Tested-by: Nick Desaulniers <ndesaulniers@google.com>

https://lore.kernel.org/linux-next/20201012141032.6333-1-cai@redhat.com/
