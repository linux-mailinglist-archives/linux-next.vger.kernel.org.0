Return-Path: <linux-next+bounces-4588-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E699B9914
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 20:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37199283074
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 19:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201C1D0F50;
	Fri,  1 Nov 2024 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9SE3XB7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EBA1CEE94;
	Fri,  1 Nov 2024 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490961; cv=none; b=BWG86V+QlPGBPli8zuvT5r4454hBRVdFKAdyN/0PumLoWSpd6WAyNoAAdjKXe4lCRVYdAgpk+1us7p6h9C69dsQ8DmPWHalDgypgpu0QaUMnKaWWPwzordMvs4nXPDrEFpo6ViZumWc8m9Q7WSGZYB6DinlGj+jQg2ilb29iH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490961; c=relaxed/simple;
	bh=s3X/5yNWdJSlQ3eMp8Fi41yVK46pfVs/1C/AskeKJM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLe74Gx74BvkdPZU4+FyPBzbtbFDIUUX8INS8K5+3ogLR8qsrGcBT3eSMOJTY7NETROWRAbivDh2CO4PDf2tNigzm1BZAhKl9NOvoHrPV1QORfUuCeGSuCXuHsLHFjNoeZc7n2H/vLYX2i4/h4fLML3nROdA1u7WHfvh452Z5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9SE3XB7; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cbcd8ce5f9so15814526d6.2;
        Fri, 01 Nov 2024 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490959; x=1731095759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V/wo6tn5xum2AVMECmALlIc/sY7DW4M/ZUa/SRoull4=;
        b=E9SE3XB7pMlEyjGJtfRaG4w2ae7PqcuL9a455YvPBCmRs44vtMBTXMYbXomGtl/b6V
         aeMrb7vepzhuN4S9SFC7ye/ngDFQDAs1HmHQoNIW8ujc89UNkXbN1o0vl0FB5Okvb7gB
         9MqEnraV3+yb7VthdkNcVgeCjzM5VQ2Q8DDYyz6UdrMXmmBrZKAoemtVc6eT+rf0lO96
         Yita4IfLf+A8A4KIH1tBC42DpmQYaHjRJdL/0dkNKISUh+fEoWLy16YB3mrTpEKPyLLu
         2spjz+arFRC6Ieqo2qBpFurZLjWGWeNc8rGwvAUBDhx5aEOG2BeR/YTeHmHoR4OKliQT
         VFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490959; x=1731095759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/wo6tn5xum2AVMECmALlIc/sY7DW4M/ZUa/SRoull4=;
        b=RQMgip5cZAHCpbKm6fKntrpMChUfCahF1uBfmPhWwdj87j24Io27YvoMMuKv9AwafF
         R8fR2IJR4apZzC+8dAsM60Y5Y3ZU8MwPW4aXzqlmcDGLygDziUtOymzzDSOFIq3GoqjX
         Np3P+RVg1YNG9r74w5Ln/39ZxwmFL+//45PQBRvWI5ZJ7UGyR5egQi3hbM9tBzbIRVAc
         R3JzgpZSfH4MbToGZZabR0nGW0OvoS2jHv8t6giYVC2UsbGmOtCtjOuU+DHgB+sRoMq3
         reCMllk7IfUC3xdn7fmCpE6nfaEQeBBUeghoP0wOBSGW+pAnGW1Y6ATJcsrKxIY+M3Yz
         qhPA==
X-Forwarded-Encrypted: i=1; AJvYcCUZNMQPtFBIzSQGeEqU7n5PV4Rf4x3j+e1+moFv4N5gX6V7jHjoKwmq45UFgLxWIVgIO9jJU+ZV8vml8eE=@vger.kernel.org, AJvYcCWbE903h5L34eB/96r4kznpKxL5q5uEdgITHj5YEbogpxis2bQ0znxUqliglvYwYD+R5PT+eQxCfJVffg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0frs4818wd2tDkQma1D8684N7feOtNbCvw9aaIRwGmowoQEm5
	E2RyHpG5CUqpTGtzyEtxqFu6MtIP59CsvbpMc+oViZ0b9Sv6il6y
X-Google-Smtp-Source: AGHT+IFPagyvh5cj1suOH5cWI+VLHf+AeDKM7KQP+P4BRYdYB9fU3T/yM3NaTN4fYGjak0m3mhjnvQ==
X-Received: by 2002:a05:6214:5d86:b0:6cb:e52c:c8dd with SMTP id 6a1803df08f44-6d35c1aeed4mr49651226d6.53.1730490958752;
        Fri, 01 Nov 2024 12:55:58 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353f9e057sm22585066d6.1.2024.11.01.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:55:58 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id BFA231200043;
	Fri,  1 Nov 2024 15:55:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 01 Nov 2024 15:55:57 -0400
X-ME-Sender: <xms:TTIlZ8lfSP9MlcD2F7JoHfhkb8lAwhsYzyVpORFeF-VXmzm1x6_U3g>
    <xme:TTIlZ716IZvAJDG00a88vUMfuZO1KixMaUrh67zEOouvT9PPu68CGYHnE1GlnrCXi
    D2Cr6mmD9yQvuSetw>
X-ME-Received: <xmr:TTIlZ6poIyW29YzSYk9Mg8DgHN0SekWjuh3OyvaprNHa2cG_2lZTCKVkxNGH7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeu
    heelhfeivdegffejgfetuefgheeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsihhgvggrshih
    sehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtg
    iipdhrtghpthhtohepvghlvhgvrhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgr
    shgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhu
    ghdrohhrghdrrghu
X-ME-Proxy: <xmx:TTIlZ4m4t81ppoFkr1cmCCtO-kX1jMBtvxUNA1VDPYPtlSe12f4gAg>
    <xmx:TTIlZ61slM-2eqUFtvsYX2nqG5HU9amq-00y81a_5kHjGQBtpZ5hkw>
    <xmx:TTIlZ_tPOHLdbUAWQtUfJZs685NaXBieXXS2vAS5OjSLUN7ldnRMEQ>
    <xmx:TTIlZ2Uh1xEeem0Q2YRoJ5ZmWADRB6auQXBl0vGA0ksX75uUNSRoXw>
    <xmx:TTIlZ93CZkjDu_5S3-pgsYBzXqo-5C55WchluOkC13vjJYGwm494Wx2L>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 15:55:57 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: paulmck@kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Marco Elver <elver@google.com>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	sfr@canb.auug.org.au,
	longman@redhat.com,
	cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH] scftorture: Use workqueue to free scf_check
Date: Fri,  1 Nov 2024 12:54:38 -0700
Message-ID: <20241101195438.1658633-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ZyUxBr5Umbc9odcH@boqun-archlinux>
References: <ZyUxBr5Umbc9odcH@boqun-archlinux>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Paul reported an invalid wait context issue in scftorture catched by
lockdep, and the cause of the issue is because scf_handler() may call
kfree() to free the struct scf_check:

	static void scf_handler(void *scfc_in)
        {
        [...]
                } else {
                        kfree(scfcp);
                }
        }

(call chain anlysis from Marco Elver)

This is problematic because smp_call_function() uses non-threaded
interrupt and kfree() may acquire a local_lock which is a sleepable lock
on RT.

The general rule is: do not alloc or free memory in non-threaded
interrupt conntexts.

A quick fix is to use workqueue to defer the kfree(). However, this is
OK only because scftorture is test code. In general the users of
interrupts should avoid giving interrupt handlers the ownership of
objects, that is, users should handle the lifetime of objects outside
and interrupt handlers should only hold references to objects.

Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
Link: https://lore.kernel.org/lkml/41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop/
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/scftorture.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/scftorture.c b/kernel/scftorture.c
index 44e83a646264..ab6dcc7c0116 100644
--- a/kernel/scftorture.c
+++ b/kernel/scftorture.c
@@ -127,6 +127,7 @@ static unsigned long scf_sel_totweight;
 
 // Communicate between caller and handler.
 struct scf_check {
+	struct work_struct work;
 	bool scfc_in;
 	bool scfc_out;
 	int scfc_cpu; // -1 for not _single().
@@ -252,6 +253,13 @@ static struct scf_selector *scf_sel_rand(struct torture_random_state *trsp)
 	return &scf_sel_array[0];
 }
 
+static void kfree_scf_check_work(struct work_struct *w)
+{
+	struct scf_check *scfcp = container_of(w, struct scf_check, work);
+
+	kfree(scfcp);
+}
+
 // Update statistics and occasionally burn up mass quantities of CPU time,
 // if told to do so via scftorture.longwait.  Otherwise, occasionally burn
 // a little bit.
@@ -296,7 +304,10 @@ static void scf_handler(void *scfc_in)
 		if (scfcp->scfc_rpc)
 			complete(&scfcp->scfc_completion);
 	} else {
-		kfree(scfcp);
+		// Cannot call kfree() directly, pass it to workqueue. It's OK
+		// only because this is test code, avoid this in real world
+		// usage.
+		queue_work(system_wq, &scfcp->work);
 	}
 }
 
@@ -335,6 +346,7 @@ static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_ra
 			scfcp->scfc_wait = scfsp->scfs_wait;
 			scfcp->scfc_out = false;
 			scfcp->scfc_rpc = false;
+			INIT_WORK(&scfcp->work, kfree_scf_check_work);
 		}
 	}
 	switch (scfsp->scfs_prim) {
-- 
2.45.2


